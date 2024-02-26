package com.lianwei.lssg.controller.before;

import com.lianwei.lssg.entity.LssgUserInfo;
import com.lianwei.lssg.entity.LssgUserLogin;
import com.lianwei.lssg.service.before.LssgUserInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
@Controller
@RequestMapping("userInfo")
public class LssgUserInfoController {
    @Resource
    private LssgUserInfoService lssgUserInfoService;
    @Resource
    HttpServletRequest request;
    /**
     *
     * */
    @RequestMapping("/addUserImgPath")
    @ResponseBody
    public Map addPath(MultipartFile file) throws IOException {
        // 图片新名字
        String name = UUID.randomUUID().toString();
        // 图片原名字
        String oldName = file.getOriginalFilename();
        // 后缀名
        String exeName = oldName.substring(oldName.lastIndexOf("."));
        //上传路径

        String path = request.getSession().getServletContext().getRealPath("uploadfiles/userImg");
        System.out.println("文件上传路径是："+path);
        File uploadfiles = new File(path);
        if (!uploadfiles.exists()){
            uploadfiles.mkdir();
        }
        File pic = new File(uploadfiles +"\\"+ name + exeName);
        // 保存图片到本地磁盘
        file.transferTo(pic);
        Map map=new HashMap();
        map.put("path1", name + exeName);
        return map;
    }

    /**
     *
     * */
    @RequestMapping("/showUserInfo")
    @ResponseBody
    public LssgUserInfo showUserInfo(){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        return lssgUserInfoService.selectOneByUserId(lssgUserLogin.getUserId());
    }

    /**
     *
     * */
    @RequestMapping("/updateUserInfo")
    @ResponseBody
    public Integer updateUserInfo(@RequestBody LssgUserInfo lssgUserInfo){
        return lssgUserInfoService.updateOneUserInfo(lssgUserInfo);
    }

    /**
     *
     * */
    @RequestMapping("/findAllByMapWithPage")
    @ResponseBody
    public Map findAllByMapWithPage(@RequestBody Map map){
        Map map1 = new HashMap();
        List<LssgUserInfo> lssgPublicInfos = lssgUserInfoService.findAllUserInfoWithPage(map);
        map1.put("count",lssgUserInfoService.querySize(map));
        map1.put("data", lssgPublicInfos);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }

    /**
     *
     * */
    @RequestMapping("/UpdateOneUserState")
    @ResponseBody
    public Integer UpdateOneUserState(@RequestParam("userState")Integer userState, @RequestParam("userInfoId")Integer userInfoId){
        return lssgUserInfoService.forbidOneUser(userInfoId,userState);
    }

    /**
     *
     * */
    @RequestMapping("/delOneUserInfo")
    @ResponseBody
    public Integer delOneAdmin(@RequestBody Integer userInfoId){
        return lssgUserInfoService.delOneUserInfoById(userInfoId);
    }

    /**
     *
     * */
    @RequestMapping("/delAllBySelected")
    @ResponseBody
    public Integer delAllBySelected(@RequestBody Integer[] userInfoIds){
        return lssgUserInfoService.deleteBatchStateByPrimaryKeySelective(userInfoIds);
    }
}

