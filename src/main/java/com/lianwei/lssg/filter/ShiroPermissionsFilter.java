/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/14
  Time: 17:31
*/
package com.lianwei.lssg.filter;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.servlet.AdviceFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ShiroPermissionsFilter extends AdviceFilter {

    private static final Logger logger = LoggerFactory
            .getLogger(ShiroPermissionsFilter.class);

    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        //Object sysUser = httpServletRequest.getSession().getAttribute("user");
        Subject subject = SecurityUtils.getSubject();
        Object userLoginName = subject.getPrincipal();
        System.out.println("userLoginName--->"+userLoginName);
        String url = httpServletRequest.getRequestURI();
        System.out.println("url-->"+url);

        if (null == userLoginName && !url.equals("/")) {
            String requestedWith = httpServletRequest.getHeader("X-Requested-With");
            if (StringUtils.isNotEmpty(requestedWith) && StringUtils.equals(requestedWith, "XMLHttpRequest")) {//如果是ajax返回指定数据
                // 重定向
                String path = httpServletRequest.getContextPath();
                String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
                System.out.println("basePath--->"+basePath);
                // ajax请求
                httpServletResponse.setHeader("sessionstatus", "TIMEOUT");
                httpServletResponse.setHeader("content_path", basePath + "beforePage/toLogin");
                httpServletResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);//403 禁止
                return false;
            } else {//不是ajax进行重定向处理
                logger.info( url+"重定向到了登录界面");
                httpServletResponse.sendRedirect("toLogin");
                return false;
            }
        }
        return true;
    }
}
