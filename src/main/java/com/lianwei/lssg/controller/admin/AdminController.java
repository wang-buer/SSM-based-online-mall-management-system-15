/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/3
  Time: 14:37
*/
package com.lianwei.lssg.controller.admin;

import com.lianwei.lssg.entity.LssgAdmin;
import com.lianwei.lssg.service.admin.LssgAdminService;
import com.lianwei.lssg.utils.DateUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Resource
    private LssgAdminService lssgAdminService;
    @Resource
    private HttpServletRequest request;

    /**
     * login.jsp
     * */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "suffixViews/login";
    }

    /**
     *
     * */
    @RequestMapping("/addAdmin")
    @ResponseBody
    public Integer addAdmin(@RequestBody LssgAdmin lssgAdmin){
        lssgAdmin.setAdminRegistTime(DateUtils.nowTime());
        ByteSource credentialsSalt = ByteSource.Util.bytes(lssgAdmin.getAdminName());
        String password = new SimpleHash("MD5",lssgAdmin.getAdminPwd(),credentialsSalt,1024).toHex();
        System.out.println("password--->"+password);
        lssgAdmin.setAdminPwd(password);
        return lssgAdminService.insertAdmin(lssgAdmin);
    }

    /**
     *
     * */
    @RequestMapping("/findOneAdminByName")
    @ResponseBody
    public LssgAdmin findOneAdminByName(@RequestBody LssgAdmin lssgAdmin){
        return lssgAdminService.selectOneAdmin(lssgAdmin);
    }

    /**
     *
     * */
    @RequestMapping("/findAllByMapWithPage")
    @ResponseBody
    public Map findAllByMapWithPage(@RequestBody Map map){
        Map map1 = new HashMap();
        List<LssgAdmin> lssgAdmins = lssgAdminService.findAllAdminWithPage(map);
        map1.put("count",lssgAdminService.querySize(map));
        map1.put("data", lssgAdmins);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }

    /**
     *
     * */
    @RequestMapping("/updateAdminState")
    @ResponseBody
    public Integer updateAdminState(@RequestBody LssgAdmin lssgAdmin){
        return lssgAdminService.updateOneAdmin(lssgAdmin);
    }

    /**
     *
     * */
    @RequestMapping("/findOneById")
    @ResponseBody
    public LssgAdmin findOneById(@RequestBody LssgAdmin lssgAdmin){
        return lssgAdminService.selectOneAdmin(lssgAdmin);
    }

    /**
     *
     * */
    @RequestMapping("/oldPwdAndNewPwd")
    @ResponseBody
    public Integer oldPwdAndNewPwd(@RequestBody LssgAdmin lssgAdmin){
        ByteSource credentialsSalt = ByteSource.Util.bytes(lssgAdmin.getAdminName());
        String password = new SimpleHash("MD5",lssgAdmin.getAdminPwd(),credentialsSalt,1024).toHex();
        System.out.println("password--->"+password);
        LssgAdmin lssgAdmin1 = lssgAdminService.selectOneAdmin(lssgAdmin);
        if(lssgAdmin1!=null&&lssgAdmin1.getAdminPwd().equals(password)){
            return 1;
        }
        return 0;
    }

    /**
     *
     * */
    @RequestMapping("/updateOneAdmin")
    @ResponseBody
    public Integer updateOneAdmin(@RequestBody LssgAdmin lssgAdmin){
        ByteSource credentialsSalt = ByteSource.Util.bytes(lssgAdmin.getAdminName());
        if(!lssgAdmin.getAdminPwd().equals("")){
            String password = new SimpleHash("MD5",lssgAdmin.getAdminPwd(),credentialsSalt,1024).toHex();
            System.out.println("password--->"+password);
            lssgAdmin.setAdminPwd(password);
        }
        return lssgAdminService.updateOneAdmin(lssgAdmin);
    }

    /**
     *
     * */
    @RequestMapping("/delOneAdmin")
    @ResponseBody
    public Integer delOneAdmin(@RequestBody Integer adminId){
        return lssgAdminService.delOneAdminById(adminId);
    }

    /**
     *
     * */
    @RequestMapping("/delAllBySelected")
    @ResponseBody
    public Integer delAllBySelected(@RequestBody Integer[] adminIds){
        return lssgAdminService.deleteBatchStateByPrimaryKeySelective(adminIds);
    }

    /**
     *
     * */
    @RequestMapping("/login")
    @ResponseBody
    public Integer login(@RequestBody LssgAdmin lssgAdmin){
        ByteSource credentialsSalt = ByteSource.Util.bytes(lssgAdmin.getAdminName());
        String password = new SimpleHash("MD5",lssgAdmin.getAdminPwd(),credentialsSalt,1024).toHex();
        System.out.println("password--->"+password);
        lssgAdmin.setAdminLastLoginTime(DateUtils.nowTime());
        lssgAdminService.updateOneAdmin(lssgAdmin);
        LssgAdmin lssgAdmin1 = lssgAdminService.selectOneAdmin(lssgAdmin);

        if(lssgAdmin1!=null&&lssgAdmin1.getAdminPwd().equals(password)){
            HttpSession session = request.getSession();
            session.setAttribute("lssgAdmin",lssgAdmin1);
            return 1;
        }
        return 0;
    }



}
