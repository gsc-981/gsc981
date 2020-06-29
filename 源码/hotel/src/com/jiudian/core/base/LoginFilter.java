package com.jiudian.core.base;

import com.jiudian.sys.entity.SysUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String requestURI = request.getRequestURI();
        SysUser sysUser = (SysUser)request.getSession().getAttribute("sysuser");
        if(sysUser!=null) {
            filterChain.doFilter(servletRequest, servletResponse);
        }
        else {
            response.sendRedirect(request.getContextPath() + "/sys/login.jsp");
        }
    }

    @Override
    public void destroy() {
    }
}
