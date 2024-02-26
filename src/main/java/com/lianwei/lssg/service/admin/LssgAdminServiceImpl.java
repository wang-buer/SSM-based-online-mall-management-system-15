/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/6/3
  Time: 14:34
*/
package com.lianwei.lssg.service.admin;

import com.lianwei.lssg.dao.admin.LssgAdminMapper;
import com.lianwei.lssg.entity.LssgAdmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class LssgAdminServiceImpl implements LssgAdminService{
    @Autowired
    private LssgAdminMapper lssgAdminMapper;
    public Integer insertAdmin(LssgAdmin lssgAdmin) {
        return lssgAdminMapper.insertAdmin(lssgAdmin);
    }

    public LssgAdmin selectOneAdmin(LssgAdmin lssgAdmin) {
        return lssgAdminMapper.selectOneAdmin(lssgAdmin);
    }

    public List<LssgAdmin> findAllAdminWithPage(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =((Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        return lssgAdminMapper.findAllAdminWithPage(map);
    }

    public Integer querySize(Map map) {
        return lssgAdminMapper.querySize(map);
    }

    public Integer updateOneAdmin(LssgAdmin lssgAdmin) {
        return lssgAdminMapper.updateOneAdmin(lssgAdmin);
    }

    public Integer delOneAdminById(Integer adminId) {
        return lssgAdminMapper.delOneAdminById(adminId);
    }

    public Integer deleteBatchStateByPrimaryKeySelective(Integer[] adminIds) {
        return lssgAdminMapper.deleteBatchStateByPrimaryKeySelective(adminIds);
    }
}
