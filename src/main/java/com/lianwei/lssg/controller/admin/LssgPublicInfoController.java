/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/2
  Time: 9:47
*/
package com.lianwei.lssg.controller.admin;

import com.lianwei.lssg.entity.LssgAdmin;
import com.lianwei.lssg.entity.LssgPublicClass;
import com.lianwei.lssg.entity.LssgPublicInfo;
import com.lianwei.lssg.service.admin.LssgPublicInfoService;
import com.lianwei.lssg.utils.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.Integer.parseInt;

@Controller
@RequestMapping("publicInfo")
public class LssgPublicInfoController {
    @Resource
    private LssgPublicInfoService lssgPublicInfoService;
    @Resource
    private HttpServletRequest request;

    /**
     *
     * */
    @RequestMapping("/findAllByMapWithPage")
    @ResponseBody
    public Map findAllByMapWithPage(@RequestBody Map map){
        Map map1 = new HashMap();
        List<LssgPublicInfo> lssgPublicInfos = lssgPublicInfoService.findAllPublicInfoWithPage(map);
        map1.put("count",lssgPublicInfoService.querySize(map));
        map1.put("data", lssgPublicInfos);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }

    /**
     *
     * */
    @RequestMapping("/UpdateOnePublicInfoState")
    @ResponseBody
    public Integer UpdateOnePublicInfoState(@RequestParam("infoState")Integer infoState, @RequestParam("publicInfoId")Integer publicInfoId){
        Map map = new HashMap();
        map.put("publicInfoId",publicInfoId);
        map.put("infoState",infoState);
        return lssgPublicInfoService.delOnePublicInfo(map);
    }

    /**
     *
     * */
    @RequestMapping("/addPublicInfo")
    @ResponseBody
    public Integer addPublicInfo(@RequestBody LssgPublicInfo lssgPublicInfo){
        HttpSession session = request.getSession();
        LssgAdmin lssgAdmin = (LssgAdmin) session.getAttribute("lssgAdmin");
        lssgPublicInfo.setPublicInfoUser(lssgAdmin.getAdminName());
        lssgPublicInfo.setPublicInfoTime(DateUtils.nowTime());
        return lssgPublicInfoService.addOnePublicInfo(lssgPublicInfo);
    }

    /**
     *
     * */
    @RequestMapping("/delOnePublicInfoById")
    @ResponseBody
    public Integer delOnePublicInfoById(@RequestBody Integer publicInfoId){
        return lssgPublicInfoService.delOnePublicInfoById(publicInfoId);
    }

    /**
     *
     * */
    @RequestMapping("/deleteSelectInfos")
    @ResponseBody
    public Integer deleteSelectInfos(@RequestBody Integer[] publicInfoIds){
        return lssgPublicInfoService.deleteBatchStateByPrimaryKeySelective(publicInfoIds);
    }

    /**
     *
     * */
    @RequestMapping("/selectOneById")
    @ResponseBody
    public LssgPublicInfo selectOneById(@RequestBody  Integer publicInfoId){
        LssgPublicInfo lssgPublicInfo = lssgPublicInfoService.selectOneById(publicInfoId);
        System.out.println("lssgPublicInfo---->"+lssgPublicInfo);
        return lssgPublicInfo;
    }

    /**
     *
     * */
    @RequestMapping("/updateOne")
    @ResponseBody
    public Integer updateOne(@RequestBody LssgPublicInfo lssgPublicInfo){
        System.out.println("lssgPublicInfo.getPublicInfoTitle()----->"+lssgPublicInfo.getPublicInfoTitle());
        //更新时间
        lssgPublicInfo.setPublicInfoTime(DateUtils.nowTime());
        //更新发布人

        return lssgPublicInfoService.updateOneById(lssgPublicInfo);
    }

    /**
     *
     * */
    @RequestMapping("/findOneClassInfo")
    @ResponseBody
    public List<LssgPublicInfo> findOneClassInfo(@RequestParam("publicClassId")String publicClassId,
                                                 @RequestParam("publicInfoId")String publicInfoId){
        Map map = new HashMap();
        map.put("publicClassId",parseInt(publicClassId));
        System.out.println(""+publicInfoId);
        if(!publicInfoId.equals("")){
            map.put("publicInfoId",parseInt(publicInfoId));
        }


        return lssgPublicInfoService.findOneByClassId(map);
    }

    @RequestMapping("/findSomePublicClassInfoWithLimit")
    @ResponseBody
    public List<LssgPublicInfo> findSomePublicClassInfoWithLimit(@RequestParam("publicClassId")Integer publicClassId){
        return lssgPublicInfoService.selectPublicClassByIdWithLimit(publicClassId);
    }


}
