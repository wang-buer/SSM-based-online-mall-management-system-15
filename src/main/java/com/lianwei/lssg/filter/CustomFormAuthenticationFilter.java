/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/4/17
  Time: 17:41
*/
package com.lianwei.lssg.filter;



import com.lianwei.lssg.entity.LssgUserLogin;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
                                     ServletResponse response) throws Exception {
        //获取已登录的用户信息
        LssgUserLogin lssgUserLogin = (LssgUserLogin) subject.getPrincipal();
        System.out.println("lssgUserLogin--->"+lssgUserLogin);
        //获取session
        HttpServletRequest httpServletRequest = WebUtils.toHttp(request);
        HttpSession session = httpServletRequest.getSession();
        //把用户信息保存到session
        session.setAttribute("lssgUserLogin", lssgUserLogin);
        return super.onLoginSuccess(token, subject, request, response);
    }
}
