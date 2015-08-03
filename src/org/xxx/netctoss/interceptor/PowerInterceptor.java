package org.xxx.netctoss.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.xxx.netctoss.entity.Privilege;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by JEWELZ on 2/8/15.
 */
public class PowerInterceptor implements org.springframework.web.servlet.HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        boolean available = false;
        String url = httpServletRequest.getRequestURI();
        List<Privilege> privileges = (List<Privilege>) httpServletRequest.getSession().getAttribute("privileges");
        for (Privilege privilege : privileges) {
            List<String> urls = privilege.getUrls();
            for (String s : urls) {
                if (url.indexOf(s) != -1 || url.indexOf("report") != -1)
                    available = true;
            }
        }
        if (!available)
            httpServletResponse.sendRedirect("/NETCTOSS/login/nopower");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
