/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/2
  Time: 9:45
*/
package com.lianwei.lssg.service.admin;

import com.lianwei.lssg.dao.admin.LssgPublicInfoMapper;
import com.lianwei.lssg.entity.LssgPublicInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class LssgPublicInfoServiceImpl implements LssgPublicInfoService{
    @Autowired
    private LssgPublicInfoMapper lssgPublicInfoMapper;

    public List<LssgPublicInfo> findAllPublicInfoWithPage(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =((Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        return lssgPublicInfoMapper.findAllPublicInfoWithPage(map);
    }

    public Integer querySize(Map map) {
        return lssgPublicInfoMapper.querySize(map);
    }

    public Integer delOnePublicInfo(Map map) {
        return lssgPublicInfoMapper.delOnePublicInfo(map);
    }

    public Integer addOnePublicInfo(LssgPublicInfo lssgPublicInfo) {
        return lssgPublicInfoMapper.addOnePublicInfo(lssgPublicInfo);
    }

    public Integer delOnePublicInfoById(Integer publicInfoId) {
        return lssgPublicInfoMapper.delOnePublicInfoById(publicInfoId);
    }

    public Integer deleteBatchStateByPrimaryKeySelective(Integer[] publicInfoIds) {
        return lssgPublicInfoMapper.deleteBatchStateByPrimaryKeySelective(publicInfoIds);
    }

    public LssgPublicInfo selectOneById(Integer publicInfoId) {
        return lssgPublicInfoMapper.selectOneById(publicInfoId);
    }

    public Integer updateOneById(LssgPublicInfo lssgPublicInfo) {
        return lssgPublicInfoMapper.updateOneById(lssgPublicInfo);
    }

    public List<LssgPublicInfo> findOneByClassId(Map map) {
        return lssgPublicInfoMapper.findOneByClassId(map);
    }

    public List<LssgPublicInfo> selectPublicClassByIdWithLimit(Integer publicClassId) {
        return lssgPublicInfoMapper.selectPublicClassByIdWithLimit(publicClassId);
    }
}
