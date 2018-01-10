package com.ngoc.servlet;

import com.ngoc.model.User;
import com.ngoc.util.DBHelper;
import com.ngoc.util.GetAndValidateData;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "ChangePasswordServlet", urlPatterns = "/Change-Password")
public class ChangePasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/admin/changePassword.jsp");
        requestDispatcher.forward(request, response);
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPassword, password, errorMessage = "";

        HttpSession session = request.getSession();
        int idUser = ((User) session.getAttribute("UserLogin")).getId();

        currentPassword = request.getParameter("currentPassword");

        GetAndValidateData getAndValidateData = new GetAndValidateData();
        password = getAndValidateData.getAndValidatePassword(request);
        getAndValidateData.validateRepassword(password, request);

        errorMessage = getAndValidateData.getError();

        if(errorMessage.equals("")) {
            Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
            if (DBHelper.getPassword(connection, idUser).equals(currentPassword)) {
                DBHelper.changePassword(connection, idUser, password);

                String successMessage = "Cập nhập password thành công";
                session.setAttribute("successMessage", successMessage);
            } else {
                errorMessage = "Current Password không đúng";
            }
        }

        if(!errorMessage.equals("")){
            session.setAttribute("error", errorMessage);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/admin/changePassword.jsp");
        requestDispatcher.forward(request, response);
        return;
    }
}
