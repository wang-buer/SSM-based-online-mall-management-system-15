/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/1
  Time: 20:13
*/
package com.lianwei.lssg.service.admin;

import com.lianwei.lssg.dao.admin.LssgPublicClassMapper;
import com.lianwei.lssg.entity.LssgPublicClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class LssgPublicClassServiceImpl implements LssgPublicClassService {
    @Autowired
    private LssgPublicClassMapper lssgPublicClassMapper;
    public Integer addOnePublicClass(LssgPublicClass lssgPublicClass) {
        return lssgPublicClassMapper.addOnePublicClass(lssgPublicClass);
    }

    public Integer delOnePublicClass(Map map) {
        return lssgPublicClassMapper.delOnePublicClass(map);
    }

    public Integer delOnePublicClassById(Integer publicClassId) {
        return lssgPublicClassMapper.delOnePublicClassById(publicClassId);
    }

    public List<LssgPublicClass> findAllPublicClass(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =((Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        return lssgPublicClassMapper.findAllPublicClass(map);
    }

    public Integer querySize(Map map) {
        return lssgPublicClassMapper.querySize(map);
    }

    public Integer deleteBatchStateByPrimaryKeySelective(Integer[] publicClassId) {
        return lssgPublicClassMapper.deleteBatchStateByPrimaryKeySelective(publicClassId);
    }

    public List<LssgPublicClass> selectAllPublicClass() {
        return lssgPublicClassMapper.selectAllPublicClass();
    }

    public List<LssgPublicClass> selectAllPublicClassByLocation(Integer locationId) {
        return lssgPublicClassMapper.selectAllPublicClassByLocation(locationId);
    }
}
