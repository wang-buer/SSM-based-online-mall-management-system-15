/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/7
  Time: 18:39
*/
package com.lianwei.lssg.realm;

import com.lianwei.lssg.entity.LssgUserLogin;
import com.lianwei.lssg.service.before.LssgUserLoginService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.web.util.WebUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LssgUserLoginRealm extends AuthorizingRealm {
    @Resource
    private LssgUserLoginService lssgUserLoginService;
    @Resource
    HttpServletRequest request;

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        LssgUserLogin lssgUserLogin = null;
        // 1. 把AuthenticationToken转换为UsernamePasswordToken
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        // 2. 从UsernamePasswordToken中获取username
        String username = upToken.getUsername();
        // 3. 若用户不存在，抛出UnknownAccountException异常
        lssgUserLogin = lssgUserLoginService.selectUserLoginInfoByUserName(username);
        if (lssgUserLogin == null)
            throw new UnknownAccountException("用户不存在！");
        // 4.
        // 根据用户的情况，来构建AuthenticationInfo对象并返回，通常使用的实现类为SimpleAuthenticationInfo
        //获取session
        HttpServletRequest httpServletRequest = WebUtils.toHttp(request);
        HttpSession session = httpServletRequest.getSession();
        //把用户信息保存到session
        session.setAttribute("lssgUserLogin", lssgUserLogin);
        // 以下信息从数据库中获取
        // （1）principal：认证的实体信息，可以是username，也可以是数据表对应的用户的实体类对象
        Object principal = username;
        System.out.println("principal---->"+principal);
        // （2）credentials：密码
        Object credentials = lssgUserLogin.getUserPwd();
        System.out.println("credentials--->"+credentials);
        // （3）realmName：当前realm对象的name，调用父类的getName()方法即可
        String realmName = getName();
        // （4）盐值：取用户信息中唯一的字段来生成盐值，避免由于两个用户原始密码相同，加密后的密码也相同
        ByteSource credentialsSalt = ByteSource.Util.bytes(username);
        System.out.println("credentialsSalt--->"+credentialsSalt);
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal, credentials, credentialsSalt, realmName);
        return info;
    }
}
