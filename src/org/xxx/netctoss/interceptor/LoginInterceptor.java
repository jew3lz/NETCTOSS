package org.xxx.netctoss.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by JEWELZ on 4/7/15.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //检查是否有登陆,是否有Controller放入的"user"的name属性
        String name = (String) httpServletRequest.getSession().getAttribute("user");
        String uri = httpServletRequest.getRequestURI();
        if (uri.contains("/login") && !uri.contains("/toIndex")) {
            return true;
        } else if (uri.contains("js") || uri.contains("style") || uri.contains("user")) {
            return true;
        } else if (name != null) {
            return true;
        } else {
            httpServletResponse.sendRedirect("/NETCTOSS/login/toLogin");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        String name = (String) httpServletRequest.getSession().getAttribute("user");
        if (name != null && (httpServletRequest.getRequestURI().contains("toLogin")))
            httpServletResponse.sendRedirect("/NETCTOSS/login/toIndex");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
