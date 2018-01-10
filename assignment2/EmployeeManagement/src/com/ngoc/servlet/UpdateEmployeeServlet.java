package com.ngoc.servlet;

import com.ngoc.model.User;
import com.ngoc.servlet.errorhandler.PageNotFoundException;
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

@WebServlet(name = "UpdateEmployeeServlet", urlPatterns = "/Users")
public class UpdateEmployeeServlet extends HttpServlet {
    static Logger logger = Logger.getLogger(UpdateEmployeeServlet.class);

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        User userOfPage = new User();

        session.setAttribute("id", id);

        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");

        userOfPage = DBHelper.getUser(connection, id);

        session.setAttribute("currentUser", userOfPage);

        if(userOfPage.getAccess() == User.STAFF_ACCESS || userOfPage.getAccess() == User.ADMIN_ACCESS){
            session.setAttribute("currentStaff", DBHelper.getStaff(connection, id));
        }
        else{
            session.setAttribute("currentTeacher", DBHelper.getTeacher(connection, id));
        }

        if (userOfPage == null) {
            throw new PageNotFoundException();
        }


        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/admin/updateEmployee.jsp");
        requestDispatcher.forward(request, response);
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = (Connection) getServletContext().getAttribute("DBConnection");
        HttpSession session = request.getSession();

        User userUpdating = (User) session.getAttribute("currentUser");

        if (updateEmployeeInfo(connection, request) == true) {
            String successMessage = "Cập nhật thông tin thành công";
            session.setAttribute("successMessage", successMessage);
            response.sendRedirect(request.getContextPath() + "/Users?id=" + userUpdating.getId());
            return;
        }else{
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/templates/admin/updateEmployee.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
    }

    public boolean updateEmployeeInfo(Connection connection, HttpServletRequest request) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userUpdating = (User) session.getAttribute("currentUser");
        request.setCharacterEncoding("UTF-8");

        String fullname = "", country = "", major = "", password = "", department = "", error = "";
        int yearOfBirth = -1, typeOfEmployee = -1, changingPassword = -1, numberOfLessons = -1, daysOfWork = -1, level = -1;
        double coefficientsSalary = -1;

        // get and validate data from requestts
        GetAndValidateData getAndValidateDate = new GetAndValidateData();

        fullname = getAndValidateDate.getAndValidateFullname(request);
        yearOfBirth = getAndValidateDate.getAndValidateYearOfBirth(request);
        country = getAndValidateDate.getAndValidateCountry(request);
        typeOfEmployee = Integer.parseInt(request.getParameter("typeOfEmployee"));

        switch (typeOfEmployee) {
            case User.STAFF_ACCESS: {
                department = getAndValidateDate.getAndValidateDepartment(request);
                daysOfWork = getAndValidateDate.getAndValidateDaysOfWork(request);
            }
            break;
            case User.TEACHER_ACCESS: {
                major = getAndValidateDate.getAndValidateMajor(request);
                numberOfLessons = getAndValidateDate.getAndValidateNumberOfLessons(request);
            }
            break;
        }

        changingPassword = Integer.parseInt(request.getParameter("changingPassword"));

        coefficientsSalary = getAndValidateDate.getAndValidateCoefficientsSalary(request);
        level = getAndValidateDate.getAndValidateLevel(request);

        if (changingPassword == 2) {
            password = getAndValidateDate.getAndValidatePassword(request);
            getAndValidateDate.validateRepassword(password, request);
        }

        error = getAndValidateDate.getError();

        if(!error.equalsIgnoreCase("")){
            session.setAttribute("error", error);
            return false;
        }
        else {

            switch (typeOfEmployee) {
                case User.STAFF_ACCESS: {
                    DBHelper.changeTypeOfEmployeeToStaff(connection, userUpdating.getId());
                    DBHelper.updateStaffTable(connection, userUpdating.getId(), department, daysOfWork);
                }
                break;
                case User.TEACHER_ACCESS: {
                    DBHelper.changeTypeOfEmployeeToTeacher(connection, userUpdating.getId());
                    DBHelper.updateTeacherTable(connection, userUpdating.getId(), major, numberOfLessons);
                }
                break;
            }

            // update User_info
            DBHelper.updateUserInfoTable(connection, userUpdating.getId(), fullname, yearOfBirth, country, coefficientsSalary, level);

            if (changingPassword == 2) {
                DBHelper.changePassword(connection, userUpdating.getId(), password);
            }

            return true;
        }

    }

}
