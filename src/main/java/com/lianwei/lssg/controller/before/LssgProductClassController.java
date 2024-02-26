package com.lianwei.lssg.controller.before;


import com.lianwei.lssg.entity.LssgProductClass;

import com.lianwei.lssg.service.before.LssgProductClassService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("LssgProductClass")
public class LssgProductClassController {
    @Resource
    private LssgProductClassService impl;
    @RequestMapping("/findByAll")
    @ResponseBody
        public List<LssgProductClass> findByAll() {
        return impl.findByAll();
    }

    @RequestMapping("/findByPage")
    @ResponseBody
    public Map findByPage(@RequestBody Map map, @RequestParam("query") String query) {

        map.put("query",query);
        List<LssgProductClass> list = this.impl.query(map);
        Map map1 = new HashMap();
        map1.put("count", impl.querySize(map));
        map1.put("data", list);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(@RequestBody int productClassId) {
        System.out.println("传入的ID是:" + productClassId);
        int result = this.impl.deleteByPrimaryKey(productClassId);
        return result;
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public Object getMe(@RequestBody Integer productClassId) {
        System.out.println("传入的ID是:" + productClassId);
        Object result = this.impl.selectByPrimaryKey(productClassId);
        return result;
    }

    @RequestMapping("/update")
    @ResponseBody
    public int edit(@RequestBody LssgProductClass lssgProductClass) {
        int result = this.impl.updateByPrimaryKeySelective(lssgProductClass);
        return result;
    }

    @RequestMapping("/add")
    @ResponseBody
    public int add(@RequestBody LssgProductClass lssgProductClass) {//接受json 需要加@RequestBody
        int result = this.impl.insertSelective(lssgProductClass);
        return result;
    }

    }

