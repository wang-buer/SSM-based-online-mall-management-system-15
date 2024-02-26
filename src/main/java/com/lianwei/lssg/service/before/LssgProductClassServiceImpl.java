package com.lianwei.lssg.service.before;


import com.lianwei.lssg.dao.before.LssgProductClassMapper;

import com.lianwei.lssg.entity.LssgProductClass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LssgProductClassServiceImpl implements LssgProductClassService {

    @Autowired
    private LssgProductClassMapper lssgProductClassMapper;

    public LssgProductClass selectByPrimaryKey(Integer productClassId) {
        return lssgProductClassMapper.selectByPrimaryKey(productClassId);
    }

    public List<LssgProductClass> findByAll() {
        return lssgProductClassMapper.findByAll();
    }

    public int deleteByPrimaryKey(Integer productClassId) {
        return lssgProductClassMapper.deleteByPrimaryKey(productClassId);
    }

    public int insertSelective(LssgProductClass lssgProductClass) {
        return lssgProductClassMapper.insertSelective(lssgProductClass);
    }

    public int updateByPrimaryKeySelective(LssgProductClass lssgProductClass) {
        return lssgProductClassMapper.updateByPrimaryKeySelective(lssgProductClass);
    }

    public List<LssgProductClass> query(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =( (Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        System.out.println("进入到服务层的查询方法");
        List<LssgProductClass> list = lssgProductClassMapper.query(map);
        return list;
    }

    public int querySize(Map map) {
        return lssgProductClassMapper.querySize(map);
    }
}
