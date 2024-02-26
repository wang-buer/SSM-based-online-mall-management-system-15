package com.lianwei.lssg.controller.before;



import com.lianwei.lssg.entity.LssgReply;
import com.lianwei.lssg.service.before.LssgReplyServiceImpl;
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
@RequestMapping("LssgReply")
public class LssgReplyController {
    @Resource
    private LssgReplyServiceImpl impl;

    @RequestMapping("/findByPage")
    @ResponseBody
    public Map findByPage(@RequestBody Map map, @RequestParam("query") String query) {
        map.put("query",query);
        List<LssgReply> list = this.impl.query(map);
        Map map1 = new HashMap();
        map1.put("count", impl.querySize(map));
        map1.put("data", list);
        map1.put("code", 0);
        map1.put("msg", "");
        return map1;
    }
}
