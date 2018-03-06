package com.ngoc.bookmanagement.Interceptor;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.model.User;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInterceptor implements HandlerInterceptor {

    private static final Logger logger = Logger.getLogger(UserInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        logger.info("UserInterceptor, preHandle, url = " + request.getRequestURI());

        HttpSession session = request.getSession();
        User userLogin = (User) session.getAttribute(Constant.userLoginSession);

        String url = request.getRequestURI();

        url = url.substring(url.indexOf("user/") + 5);

        if(url.indexOf("/") > 0) {
            url = url.substring(0, url.indexOf("/"));
        }

        try{
            long idUserOfPage = Long.parseLong(url);

            if(idUserOfPage != userLogin.getId()) {
                response.sendRedirect(request.getContextPath() + "/403");
                return false;
            }

            return true;
        }
        catch(NumberFormatException exception){
            response.sendRedirect(request.getContextPath() + "/404");
            return false;
        }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}
