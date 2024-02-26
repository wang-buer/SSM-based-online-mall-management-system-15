/*
  Created by IntelliJ IDEA.
  User: Kalvin
  Date: 2020/5/11
  Time: 13:29
*/
package com.lianwei.lssg.Exception;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyExceptionResolver implements HandlerExceptionResolver {

public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
    System.out.println(ex.getClass()); ex.printStackTrace();//开发时必需
    ModelAndView mv = new ModelAndView();
    if(ex instanceof IncorrectCredentialsException || ex instanceof UnknownAccountException){
        //跳转登录⻚⾯，重新登录
        mv.setViewName("redirect:/beforePage/toLogin");
    }else if(ex instanceof UnauthorizedException){// ⻆⾊不⾜
        //跳转权限不⾜的⻚⾯
        mv.setViewName("redirect:/user/perms/error");
    }else if(ex instanceof UnauthenticatedException){//没有登录 没有合法身份
        //跳转登录⻚⾯，重新登录
        mv.setViewName("redirect:/beforePage/toLogin");
    }
    return mv;
}
}