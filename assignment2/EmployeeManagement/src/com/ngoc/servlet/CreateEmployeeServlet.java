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

@WebServlet(name = "CreateEmployeeServlet", urlPatterns = "/Create-Employee")
public class CreateEmployeeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/admin/createEmployee.jsp");
        requestDispatcher.forward(request, response);
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = "", password = "", fullname = "", country = "", department = "", major = "", errorMessage = "";
        int yearOfBirth = -1, level = -1, daysOfWork = -1, iduser, typeOfEmployee, numberOfLessons = -1;
        double coefficientsSalary = -1;
        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        HttpSession session = request.getSession();

        GetAndValidateData getAndValidateData = new GetAndValidateData();
        typeOfEmployee = Integer.parseInt(request.getParameter("typeOfEmployee"));
        System.out.println(typeOfEmployee);
        username = getAndValidateData.getAndValidateUsername(request);
        password = getAndValidateData.getAndValidatePassword(request);
        getAndValidateData.validateRepassword(password, request);
        fullname = getAndValidateData.getAndValidateFullname(request);
        yearOfBirth = getAndValidateData.getAndValidateYearOfBirth(request);
        country = getAndValidateData.getAndValidateCountry(request);
        level = getAndValidateData.getAndValidateLevel(request);
        coefficientsSalary = getAndValidateData.getAndValidateCoefficientsSalary(request);

        switch (typeOfEmployee) {
            case User.STAFF_ACCESS: {
                department = getAndValidateData.getAndValidateDepartment(request);
                daysOfWork = getAndValidateData.getAndValidateDaysOfWork(request);
                level = getAndValidateData.getAndValidateLevel(request);
            }
            break;

            case User.TEACHER_ACCESS: {
                major = getAndValidateData.getAndValidateMajor(request);
                numberOfLessons = getAndValidateData.getAndValidateNumberOfLessons(request);
                level = getAndValidateData.getAndValidateLevel(request);
            }
            break;
        }

        getAndValidateData.validateDuplicateUsername(connection, username);
        errorMessage = getAndValidateData.getError();

        if(errorMessage.equals("")){
            // insert user
            DBHelper.insertUser(connection, username, password, typeOfEmployee);
            // get id_user
            iduser = DBHelper.getIdUser(connection, username);
            // insert user_info
            DBHelper.insertUserInfo(connection, iduser, typeOfEmployee, fullname, yearOfBirth, country, coefficientsSalary, level);

            switch (typeOfEmployee) {
                case User.STAFF_ACCESS: {
                    // insert staff
                    DBHelper.insertStaffTable(connection, iduser, department, daysOfWork);
                    // insert teacher with value empty
                    DBHelper.insertTeacherTable(connection, iduser, "", 0);
                }
                break;
                case User.TEACHER_ACCESS: {
                    // insert teacher
                    DBHelper.insertTeacherTable(connection, iduser, major, numberOfLessons);
                    // insert staff with value empty
                    DBHelper.insertStaffTable(connection, iduser, "", 0);
                }
                break;
            }

            String successMessage = "Tạo nhân viên mới thành công";
            session.setAttribute("successMessage", successMessage);

            response.sendRedirect(request.getContextPath() + "/Management");
            return;
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/admin/createEmployee.jsp");
        requestDispatcher.forward(request, response);
        return;
    }
}
