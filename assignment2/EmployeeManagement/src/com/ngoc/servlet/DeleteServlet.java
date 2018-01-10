package com.ngoc.servlet;

import com.ngoc.util.DBHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

// /Delete?id=
@WebServlet(name = "DeleteServlet", urlPatterns = "/Delete")
public class DeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUser = Integer.parseInt(request.getParameter("id"));

        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");

        System.out.println(DBHelper.deleteUser(connection, idUser));

        HttpSession session = request.getSession();
        String successMessage = "Xóa nhân viên thành công";
        session.setAttribute("success", successMessage);

        response.sendRedirect(request.getContextPath() + "/Management");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
