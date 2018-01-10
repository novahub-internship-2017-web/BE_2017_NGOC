package com.ngoc.servlet;

import com.ngoc.model.User;
import com.ngoc.util.DBHelper;
import com.ngoc.util.GetAndValidateData;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "LoginServlet", urlPatterns = "/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static Logger logger = Logger.getLogger(LoginServlet.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rq = request.getRequestDispatcher("/templates/login.jsp");
        rq.forward(request, response);
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = "", password = "", errorMessage = "";
        User user = null;

        GetAndValidateData getAndValidateData = new GetAndValidateData();
        username = getAndValidateData.getAndValidateUsername(request);
        password = getAndValidateData.getAndValidatePassword(request);

        errorMessage = getAndValidateData.getError();

        HttpSession session = request.getSession();

        if(errorMessage.equals("")) {
            Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
            user = DBHelper.getUser(connection, username, password);
        }

        if (user != null) {
            session.setAttribute("UserLogin", user);
            if (user.getActive() && (user.getAccess() == User.ADMIN_ACCESS)) {
                response.sendRedirect(request.getContextPath() + "/Management");
                return;
            }

            if (user.getActive() && (user.getAccess() == User.STAFF_ACCESS || user.getAccess() == User.TEACHER_ACCESS)){
                response.sendRedirect(request.getContextPath() + "/Users?id=" + user.getId());
                return;
            }
        }

        errorMessage = "No user found with given username id, please register first";
        session.setAttribute("error", errorMessage);

        if(!errorMessage.equals("")){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/login.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
    }

}