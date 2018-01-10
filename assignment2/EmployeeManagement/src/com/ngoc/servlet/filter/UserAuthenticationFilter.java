package com.ngoc.servlet.filter;

import com.ngoc.model.User;
import com.ngoc.servlet.errorhandler.HaveNotPermissonException;
import com.ngoc.servlet.errorhandler.PageNotFoundException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "UserAuthenticationFilter")
public class UserAuthenticationFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String method = request.getMethod();

        if(method.equals("GET")) {

            int id;

            try {
                id = Integer.parseInt(request.getParameter("id"));
            } catch (NumberFormatException ex) {
                throw new PageNotFoundException();
            }

            HttpSession session = request.getSession();
            User userLogin = (User) session.getAttribute("UserLogin");

            if (userLogin.getAccess() != User.ADMIN_ACCESS) {
                if (id != userLogin.getId()) {
                    throw new HaveNotPermissonException();
                }
            }
        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
