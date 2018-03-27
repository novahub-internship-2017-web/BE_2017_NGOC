package com.ngoc.bookmanagement.Interceptor;

import com.ngoc.bookmanagement.model.User;
import org.apache.log4j.Logger;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AuthenticateInterceptor implements HandlerInterceptor{

    private static final Logger logger = Logger.getLogger(AuthenticateInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
        throws Exception {

        logger.info("AuthenticateInterceptor, preHandle, url = " + request.getRequestURI());

        User userLogin = (User) request.getSession().getAttribute("userLogin");

        if (userLogin != null) {
            return true;
        } else {
            response.sendRedirect(request.getContextPath() + "/403");
            return false;
        }
    }
}
