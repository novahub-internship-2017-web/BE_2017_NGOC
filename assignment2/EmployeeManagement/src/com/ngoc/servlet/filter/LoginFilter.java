package com.ngoc.servlet.filter;

import com.ngoc.model.User;
import com.ngoc.servlet.errorhandler.PageNotFoundException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebFilter(filterName = "LoginFilter", urlPatterns = "/*")
public class LoginFilter implements Filter {

    ArrayList<String> whiteURLs;
    ArrayList<String> adminURLs;
    ArrayList<String> employeeURLs;

    public void init(FilterConfig config) throws ServletException {
        whiteURLs = new ArrayList<String>();
        adminURLs = new ArrayList<String>();
        employeeURLs = new ArrayList<String>();

        whiteURLs.add("/");
        whiteURLs.add("/Login");

        adminURLs.add("/Users");
        adminURLs.add("/Management");
        adminURLs.add("/Create-Employee");
        adminURLs.add("/Change-Password");
        adminURLs.add("/Logout");
        adminURLs.add("/Delete");

        employeeURLs.add("/Change-Password");
        employeeURLs.add("/Users");
        employeeURLs.add("/Logout");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        HttpSession session = request.getSession(false);

        String requestURI = request.getRequestURI();

        if(requestURI.contains("/templates") == true){
            chain.doFilter(req, resp);
        }

        User user = null;

        if(session != null){
            user = (User) session.getAttribute("UserLogin");
        }

        if(user != null){
            switch (user.getAccess()){
                case User.ADMIN_ACCESS:{
                    if(!isAdminURL(requestURI) && !isWhiteURL(requestURI)) {
                        throw new PageNotFoundException();
                    }
                    else{
                        if(isWhiteURL(requestURI)){
                            response.sendRedirect(request.getContextPath() + "/Management");
                            return;
                        }
                    }
                }
                break;

                case User.STAFF_ACCESS:
                case User.TEACHER_ACCESS:{
                    if(!isEmployeeURL(requestURI) && !isWhiteURL(requestURI)){
                        throw new PageNotFoundException();
                    }
                    else{
                        if(isWhiteURL(requestURI)){
                            response.sendRedirect("Users?id=" + user.getId());
                            return;
                        }
                    }
                }
                break;

            }
        }
        else {
            if (isWhiteURL(requestURI) == false) {
                throw new PageNotFoundException();
            }
        }

        chain.doFilter(req, resp);

    }

    public void destroy() {
    }

    boolean isWhiteURL(String URI){
        for(String whiteURL : whiteURLs){
            if(URI.endsWith(whiteURL)){

                return true;
            }
        }

        return false;
    }

    boolean isAdminURL(String URI){
        for(String adminURL : adminURLs){
            if(URI.endsWith(adminURL)){

                return true;
            }
        }

        return false;
    }

    boolean isEmployeeURL(String URI){
        for(String employeeURL : employeeURLs){

            if(URI.endsWith(employeeURL)){
                return true;
            }
        }

        return false;
    }
}
