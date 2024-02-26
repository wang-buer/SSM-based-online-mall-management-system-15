/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/10
  Time: 9:17
*/
package com.lianwei.lssg.service.before;

import com.lianwei.lssg.dao.before.LssgUserLoginMapper;
import com.lianwei.lssg.entity.LssgUserLogin;
import com.lianwei.lssg.utils.DateUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


@Service
public class LssgUserLoginServiceImpl implements LssgUserLoginService{
    @Autowired
    private LssgUserLoginMapper lssgUserLoginMapper;
    /**
     *
     * */
    public LssgUserLogin selectUserLoginInfoByUserName(String username) {
        return lssgUserLoginMapper.selectUserLoginInfoByUserName(username);
    }

    public Map selectUserLoginInfoByUserId(Integer userId, String oldUserPwd) {
        Map map = new HashMap();
        LssgUserLogin lssgUserLogin = lssgUserLoginMapper.selectUserLoginInfoByUserId(userId);
        ByteSource credentialsSalt = ByteSource.Util.bytes(lssgUserLogin.getUserName());
        //原密码
        String oldPwd = lssgUserLogin.getUserPwd();
        System.out.println("okdPwd--->"+oldPwd);
        //输入的密码
        String password = new SimpleHash("MD5",oldUserPwd,credentialsSalt,1024).toHex();
        if(oldPwd.equals(password)){
            map.put("isPwd",true);
        }else{
            map.put("isPwd",false);
        }
        map.put("lssgUserLogin",lssgUserLogin);
        System.out.println("password----1---->"+password);
        return map;
    }

    /**
     *
     * */
    public int addOneUserLoginInfo(LssgUserLogin lssgUserLogin) {
        ByteSource credentialsSalt = ByteSource.Util.bytes(lssgUserLogin.getUserName());
        String password = new SimpleHash("MD5",lssgUserLogin.getUserPwd(),credentialsSalt,1024).toHex();
        System.out.println("password--->"+password);
        lssgUserLogin.setUserPwd(password);
        lssgUserLogin.setRegistTime(DateUtils.nowTime());
        return lssgUserLoginMapper.addOneUserLoginInfo(lssgUserLogin);
    }

    public Integer updateUserPwdByUserId(LssgUserLogin lssgUserLogin) {
        ByteSource credentialsSalt = ByteSource.Util.bytes(lssgUserLogin.getUserName());
        String password = new SimpleHash("MD5",lssgUserLogin.getUserPwd(),credentialsSalt,1024).toHex();
        System.out.println("password----2---->"+password);
        lssgUserLogin.setUserPwd(password);
        return lssgUserLoginMapper.updateUserPwdByUserId(lssgUserLogin);
    }

    public Integer forbidUserByUserId(LssgUserLogin lssgUserLogin) {
        return lssgUserLoginMapper.forbidUserByUserId(lssgUserLogin);
    }

    public Integer delOneUserById(Integer userId) {
        return lssgUserLoginMapper.delOneUserById(userId);
    }

    public Integer deleteBatchStateByPrimaryKeySelective(Integer[] userIds) {
        return lssgUserLoginMapper.deleteBatchStateByPrimaryKeySelective(userIds);
    }

    public int querySize() {
        return lssgUserLoginMapper.querySize();
    }
}
