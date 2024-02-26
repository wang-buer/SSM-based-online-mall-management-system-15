package com.lianwei.lssg.dao.before;


import com.lianwei.lssg.entity.LssgUserInfo;

import java.util.List;
import java.util.Map;

public interface LssgUserInfoMapper {
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
    LssgUserInfo selectOneByUserInfoId(Integer userInfoId);

    /**
     *
     * */
    Integer delOneUserInfoById(Integer userInfoId);

    /**
     *
     * */
    Integer deleteBatchStateByPrimaryKeySelective(Integer[] userInfoIds);
}
