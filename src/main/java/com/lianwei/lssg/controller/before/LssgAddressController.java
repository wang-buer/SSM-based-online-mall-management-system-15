/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/24
  Time: 10:16
*/
package com.lianwei.lssg.controller.before;

import com.lianwei.lssg.entity.LssgAddress;
import com.lianwei.lssg.entity.LssgUserLogin;
import com.lianwei.lssg.service.before.LssgAddressService;
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

@Controller
@RequestMapping("address")
public class LssgAddressController {
    @Resource
    private LssgAddressService lssgAddressService;
    @Resource
    HttpServletRequest request;
    /**
     *
     * */
    @RequestMapping("/addOneAddress")
    @ResponseBody
    public Map addOneAddress(@RequestBody LssgAddress lssgAddress){
        Map map = new HashMap();
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        lssgAddress.setLssgUserLogin(lssgUserLogin);
        int i = lssgAddressService.addOneAddress(lssgAddress);
        if(i>0){
            map.put("data",true);
            map.put("message","添加成功");
        }else{
            map.put("data",false);
            map.put("message","添加失败");
        }
        return map;
    }

    /**
     * 查找所有地址
     * */
    @RequestMapping("/findAllAddressByUserId")
    @ResponseBody
    public List<LssgAddress> findAllAddressByUserId(){
        HttpSession session = request.getSession();
        LssgUserLogin lssgUserLogin = (LssgUserLogin) session.getAttribute("lssgUserLogin");
        return lssgAddressService.selectAllAddressByUserId(lssgUserLogin.getUserId());
    }

    /**
     * 根据地址id查找
     * */
    @RequestMapping("/findOneAddressById")
    @ResponseBody
    public LssgAddress findOneAddressById(@RequestParam("addressId")Integer addressId){
        return lssgAddressService.selectOneAddressById(addressId);
    }

    /**
     * 修改地址
     * */
    @RequestMapping("/updateAddress")
    @ResponseBody
    public Integer updateAddress(@RequestBody LssgAddress lssgAddress){
        return lssgAddressService.updateOneAddressById(lssgAddress);
    }

    /**
     * 删除一条地址信息
     * */
    @RequestMapping("/delAddress")
    @ResponseBody
    public Integer delAddress(@RequestParam("addressId")Integer addressId){
        return lssgAddressService.delOneAddressById(addressId);
    }
}
