/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/30
  Time: 9:58
*/
package com.lianwei.lssg.service.before;

import com.lianwei.lssg.dao.before.LssgUserInfoMapper;
import com.lianwei.lssg.dao.before.LssgUserLoginMapper;
import com.lianwei.lssg.entity.LssgUserInfo;
import com.lianwei.lssg.entity.LssgUserLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class LssgUserInfoServiceImpl implements LssgUserInfoService{
    @Autowired
    private LssgUserInfoMapper lssgUserInfoMapper;
    @Autowired
    private LssgUserLoginMapper lssgUserLoginMapper;

    public Integer addOneUserInfo(LssgUserInfo lssgUserInfo) {
        return lssgUserInfoMapper.addOneUserInfo(lssgUserInfo);
    }

    public LssgUserInfo selectOneByUserId(Integer userId) {
        return lssgUserInfoMapper.selectOneByUserId(userId);
    }

    public Integer updateOneUserInfo(LssgUserInfo lssgUserInfo) {
        return lssgUserInfoMapper.updateOneUserInfo(lssgUserInfo);
    }

    public List<LssgUserInfo> findAllUserInfoWithPage(Map map) {
        int count =(Integer) map.get("nums");//每一页显示的条数
        int start =((Integer)map.get("curr")-1)*count;//每一页的开始下标
        map.put("start",start);
        return lssgUserInfoMapper.findAllUserInfoWithPage(map);
    }

    public Integer querySize(Map map) {
        return lssgUserInfoMapper.querySize(map);
    }

    @Transactional
    public Integer forbidOneUser(Integer userInfoId, Integer userState) {
        LssgUserInfo lssgUserInfo = lssgUserInfoMapper.selectOneByUserInfoId(userInfoId);
        System.out.println("lssgUserInfo.getLssgUserLogin().getUserId()------>"+lssgUserInfo.getLssgUserLogin().getUserId());
        LssgUserLogin lssgUserLogin = lssgUserLoginMapper.selectUserLoginInfoByUserId(lssgUserInfo.getLssgUserLogin().getUserId());
        lssgUserLogin.setUserState(userState);
        return lssgUserLoginMapper.forbidUserByUserId(lssgUserLogin);
    }

    public Integer delOneUserInfoById(Integer userInfoId) {
        /*LssgUserInfo lssgUserInfo = lssgUserInfoMapper.selectOneByUserInfoId(userInfoId);
        lssgUserLoginMapper.delOneUserById(lssgUserInfo.getLssgUserLogin().getUserId());*/
        return lssgUserInfoMapper.delOneUserInfoById(userInfoId);
    }

    public Integer deleteBatchStateByPrimaryKeySelective(Integer[] userInfoIds) {
        return lssgUserInfoMapper.deleteBatchStateByPrimaryKeySelective(userInfoIds);
    }


}
