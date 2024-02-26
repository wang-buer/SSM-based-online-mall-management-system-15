/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/10
  Time: 9:24
*/
package com.lianwei.lssg.controller.before;

import com.lianwei.lssg.entity.LssgUserInfo;
import com.lianwei.lssg.entity.LssgUserLogin;
import com.lianwei.lssg.service.before.LssgUserInfoService;
import com.lianwei.lssg.service.before.LssgUserLoginService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.annotation.RequiresGuest;
import org.apache.shiro.authz.annotation.RequiresUser;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.SavedRequest;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("userLoginInfo")
public class LssgUserLoginController {
    @Resource
    private LssgUserLoginService lssgUserLoginService;
    @Resource
    private LssgUserInfoService lssgUserInfoService;
    @Resource
    HttpServletRequest request;
    /**
     *查询一条用户登入信息    userLoginInfo/findOneUserLoginInfo
     * */
    @RequestMapping("/findOneUserLoginInfo")
    @ResponseBody
    public LssgUserLogin findOneUserLoginInfo(@RequestParam(value="username",required = false)String username){
        System.out.println("username---->"+username);
        return lssgUserLoginService.selectUserLoginInfoByUserName(username);
    }

    /**
     *查询一条用户信息    userLoginInfo/findOneUserLoginInfo
     * */
    @RequestMapping("/findOneUserInfo")
    @ResponseBody
    public LssgUserInfo findOneUserInfo(@RequestParam(value="username",required = false)String username){
        System.out.println("username---->"+username);
        LssgUserLogin lssgUserLogin = lssgUserLoginService.selectUserLoginInfoByUserName(username);
        return lssgUserInfoService.selectOneByUserId(lssgUserLogin.getUserId());
    }

    /**
     *
     * */
    @RequestMapping("/findOneUserLoginInfoByUserId")
    @ResponseBody
    public Map findOneUserLoginInfoByUserId(@RequestParam(value = "oldUserPwd",required = false)String oldUserPwd){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        return lssgUserLoginService.selectUserLoginInfoByUserId(lssgUserLogin.getUserId(),oldUserPwd);
    }

    /**
     * 用户注册
     * */
    @RequestMapping("/regist")
    @ResponseBody
    @Transactional
    public int regist(@RequestBody LssgUserLogin lssgUserLogin){
        int i = lssgUserLoginService.addOneUserLoginInfo(lssgUserLogin);
        System.out.println("lssgUserLogin--->"+lssgUserLogin);
        LssgUserLogin lssgUserLogin1 = lssgUserLoginService.selectUserLoginInfoByUserName(lssgUserLogin.getUserName());
        LssgUserInfo lssgUserInfo = new LssgUserInfo();
        if(i>0){
            lssgUserInfo.setLssgUserLogin(lssgUserLogin1);
            System.out.println("lssgUserLogin1---->"+lssgUserLogin1);
            lssgUserInfoService.addOneUserInfo(lssgUserInfo);
            return 1;
        }
        return 0;
    }


    /**
     * 用户登入认证
     * */
    @RequestMapping("/login")
    @ResponseBody
    public Map login(@RequestParam(value="username",required = true)String username, @RequestParam("userpwd")String userpwd, @RequestParam("on")boolean on,HttpServletRequest request){
       Map map = new HashMap();

        Subject currentUser = SecurityUtils.getSubject();
        System.out.println("currentUser--->"+currentUser);
        if (!currentUser.isAuthenticated()) {
            UsernamePasswordToken upToken = new UsernamePasswordToken(username, userpwd);
            upToken.setRememberMe(on);
            try {
                currentUser.login(upToken);
                map.put("success",true);
                map.put("message","登入成功！");
                String url = "/beforePage/toIndex";
                SavedRequest savedRequest = WebUtils.getSavedRequest(request);
                System.err.println("savedRequest:"+savedRequest);
                if(null!=savedRequest){
                    // 登录前url
                    url =savedRequest.getRequestUrl();
                    String method = savedRequest.getMethod();  //GET/POST
                    System.out.println("url--->"+url+"method--->"+method);
                    // 取得url之后对SavedRequest进行清空
                    // 如果未使用接口方式，可以直接跳转url并清空，使用WebUtils中的redirectToSavedRequest方法
                    WebUtils.getAndClearSavedRequest(request);
                }
                map.put("url",url);
            } catch (IncorrectCredentialsException ice) {
                System.out.println("密码不匹配！");
                map.put("success",false);
                map.put("message","密码错误！");
            } catch (UnknownAccountException lae) {
                map.put("success",false);
                map.put("message","账号不存在！");
            } catch (LockedAccountException lae) {
                System.out.println("账户已被冻结！");
                map.put("success",false);
                map.put("message","账号被锁定！");
            } catch (AuthenticationException ae) {
                System.out.println(ae.getMessage());
                map.put("success",false);
                map.put("message","未知错误(配置文件数据库连接的密码错误啦)！");
            }

        }
        return map;
    }

    /**
     * 用户修改密码
     * */
    @RequestMapping("/updateUserPwd")
    @ResponseBody
    public Integer updateUserPwd(@RequestBody LssgUserLogin lssgUserLogin){
        System.out.println("lssgUserLogin.getUserId()------"+lssgUserLogin.getUserId());
        return  lssgUserLoginService.updateUserPwdByUserId(lssgUserLogin);
    }

    /**
     *
     * */
    @RequestMapping("/userCount")
    @ResponseBody
    public int userCount(){
        return lssgUserLoginService.querySize();
    }
}
