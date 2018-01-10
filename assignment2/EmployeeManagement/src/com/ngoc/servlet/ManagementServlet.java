package com.ngoc.servlet;

import com.ngoc.model.Staff;
import com.ngoc.model.Teacher;
import com.ngoc.model.User;
import com.ngoc.util.DBHelper;
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
import java.util.ArrayList;

@WebServlet(name = "AdminServlet", urlPatterns = "/Management")
public class ManagementServlet extends HttpServlet {
    static Logger logger = Logger.getLogger(ManagementServlet.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String word = request.getParameter("word");

        if(word == null)
            word = "";

        ArrayList<User> userArrayList = selectByName(word);

        HttpSession session = request.getSession();

        session.setAttribute("resultOfSearching", userArrayList);

        RequestDispatcher rq = request.getRequestDispatcher("/templates/admin/management.jsp");
        rq.forward(request, response);
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String words = request.getParameter("words");

        ArrayList<User> userArrayList = selectByName(words);

        HttpSession session = request.getSession();

        session.setAttribute("resultOfSearching", userArrayList);

        response.sendRedirect(request.getContextPath() + "/Management?word=" + words);
    }

    private ArrayList<User> selectByName(String name) throws ServletException {
        ArrayList<User> userList = new ArrayList<User>();
        ArrayList<Staff> staffList = new ArrayList<Staff>();
        ArrayList<Teacher> teacherList = new ArrayList<Teacher>();

        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        staffList = DBHelper.getListStaffByFullname(connection, name);
        teacherList = DBHelper.getListTeacherByFullname(connection, name);

        for(Staff singleStaff : staffList){
            userList.add(singleStaff);
        }

        for(Teacher singleTeacher : teacherList){
            userList.add(singleTeacher);
        }

        return userList;
    }
}
