package com.lianwei.lssg.service.before;

import com.lianwei.lssg.entity.LssgUserInfo;

import java.util.List;
import java.util.Map;

public interface LssgUserInfoService {

    /**
     *
     * */
    Integer addOneUserInfo(LssgUserInfo lssgUserInfo);
    /**
     *
     * */
    LssgUserInfo selectOneByUserId(Integer userId);

    /**
     *
     * */
    Integer updateOneUserInfo(LssgUserInfo lssgUserInfo);

    /**
     *
     * */
    List<LssgUserInfo> findAllUserInfoWithPage(Map map);

    /**
     *
     * */
    Integer querySize(Map map);

    /**
     *
     *
     * */
    Integer forbidOneUser(Integer userInfoId,Integer userState);

    /**
     *
     * */
    Integer delOneUserInfoById(Integer userInfoId);

    /**
     *
     * */
    Integer deleteBatchStateByPrimaryKeySelective(Integer[] userInfoIds);
}
