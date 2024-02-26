package com.lianwei.lssg.dao.before;

import com.lianwei.lssg.entity.LssgUserLogin;

public interface LssgUserLoginMapper {
    /**
     * 通过用户名查询用户登入信息
     * */
    LssgUserLogin selectUserLoginInfoByUserName(String username);


    /**
     *验证新密码和原密码是否一致
     * */
    LssgUserLogin selectUserLoginInfoByUserId(Integer userId);

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
