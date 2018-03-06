package com.ngoc.bookmanagement.Interceptor;

import com.ngoc.bookmanagement.model.User;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(LoginInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        logger.info("LoginInterceptor, preHandle, url = " + request.getRequestURI());

        User userLogin = (User) request.getSession().getAttribute("userLogin");

        if (userLogin != null) {
            response.sendRedirect(request.getContextPath() + "/");
        }

        return true;
    }
}
