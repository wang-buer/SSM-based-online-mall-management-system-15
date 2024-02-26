package com.lianwei.lssg.service.before;

import com.lianwei.lssg.entity.LssgUserLogin;

import java.util.Map;

public interface LssgUserLoginService {
    /**
     * 通过用户名查询用户登入信息
     * */
    LssgUserLogin selectUserLoginInfoByUserName(String username);

    /**
     *
     * */
    Map selectUserLoginInfoByUserId(Integer userId, String oldUserPwd);

    /**
     * 添加一条数据
     * */
    int addOneUserLoginInfo(LssgUserLogin lssgUserLogin);

    /**
     *
     * */
    Integer updateUserPwdByUserId(LssgUserLogin lssgUserLogin);

    /**
     *
     * */
    Integer forbidUserByUserId(LssgUserLogin lssgUserLogin);

    /**
     *
     * */
    Integer delOneUserById(Integer userId);

    /**
     *
     * */
    Integer deleteBatchStateByPrimaryKeySelective(Integer[] userIds);

    /**
     *
     * */
    int querySize();
}
