/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/2
  Time: 13:41
*/
package com.lianwei.lssg.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("upload")
public class fileUploadController {
    /**
     *
     * */
    @RequestMapping("/addPath")
    @ResponseBody
    public Map addPath(HttpServletRequest request, MultipartFile file
    ) throws IOException {
        // 图片新名字
        String name = UUID.randomUUID().toString();
        // 图片原名字
        String oldName = file.getOriginalFilename();
        // 后缀名
        String exeName = oldName.substring(oldName.lastIndexOf("."));
        //上传路径

        String path = request.getSession().getServletContext().getRealPath("uploadfiles/notice");
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
    @RequestMapping("/addAdminPath")
    @ResponseBody
    public Map addAdminPath(HttpServletRequest request, MultipartFile file
    ) throws IOException {
        // 图片新名字
        String name = UUID.randomUUID().toString();
        // 图片原名字
        String oldName = file.getOriginalFilename();
        // 后缀名
        String exeName = oldName.substring(oldName.lastIndexOf("."));
        //上传路径

        String path = request.getSession().getServletContext().getRealPath("uploadfiles/admin");
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
}
