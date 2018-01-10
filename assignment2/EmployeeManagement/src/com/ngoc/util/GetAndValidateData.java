package com.ngoc.util;

import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

public class GetAndValidateData {
    static Logger logger = Logger.getLogger(GetAndValidateData.class);

    private String error;

    public GetAndValidateData(){
        this.error = "";
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getAndValidateFullname(HttpServletRequest request){
        String fullname = request.getParameter("fullname");
        if(fullname == null || fullname.equalsIgnoreCase("")){
            error += "Họ tên không được bỏ trống\n";
        }
        else if(fullname.length() > 50){
            error += "Họ tên chỉ chứa tối đa 50 kí tự\n";
        }
        else if(fullname.length() < 3){
            error += "Họ tên phải chứa ít nhất 3 kí tự\n";
        }

        return fullname;
    }

    public int getAndValidateYearOfBirth(HttpServletRequest request){
        int yearOfBirth = -1;
        try {
            yearOfBirth = Integer.parseInt(request.getParameter("year_of_birth"));

            int yearOfNow = Calendar.getInstance().get(Calendar.YEAR);
            if(yearOfNow - yearOfBirth < 18){
                error += "Năm sinh không phù hợp, bạn chưa đủ 18 tuổi";
            }
        }catch(NumberFormatException ex){
            error += "Năm sinh phải là số nguyên\n";
        }

        return yearOfBirth;
    }

    public String getAndValidateCountry(HttpServletRequest request){
        String country = request.getParameter("country");
        if(country == null || country.equalsIgnoreCase(""))
            error += "Quê quán không được bỏ trống\n";

        return country;
    }

    public String getAndValidateMajor(HttpServletRequest request){
        String major = request.getParameter("major");
        if(major == null || major.equalsIgnoreCase(""))
            error += "Khoa không được bỏ trống\n";

        return major;
    }

    public int getAndValidateNumberOfLessons(HttpServletRequest request){
        int numberOfLessons = -1;
        try {
            if(!(request.getParameter("number_of_lessons").equals("") && request.getParameter("number_of_lessons") == null))
                numberOfLessons = Integer.parseInt(request.getParameter("number_of_lessons"));
            else{
                error += "Số tiết dạy không được bỏ trống\n";
            }
        }catch(NumberFormatException ex){
            error += "Số tiết dạy phải là số nguyên\n";
        }

        return numberOfLessons;
    }

    public String getAndValidateDepartment(HttpServletRequest request){
        String department = request.getParameter("department");

        if(department == null || department.equalsIgnoreCase("")){
            error += "Phòng ban không được bỏ trống\n";
        }

        return department;
    }

    public int getAndValidateDaysOfWork(HttpServletRequest request){
        int daysOfWork = -1;

        try{
            daysOfWork = Integer.parseInt(request.getParameter("days_of_work"));
        }catch (NumberFormatException ex){
            error += "Số ngày công phải là số nguyên\n";
        }

        return  daysOfWork;
    }

    public double getAndValidateCoefficientsSalary(HttpServletRequest request){
        double coefficientsSalary = -1;

        try{
            coefficientsSalary = Double.parseDouble(request.getParameter("coefficients_salary"));
        }catch (NumberFormatException ex){
            error += "Hệ số lương không được bỏ trống\n";
        }

        return coefficientsSalary;
    }

    public int getAndValidateLevel(HttpServletRequest request){
        int level = -1;
        try{
            level = Integer.parseInt(request.getParameter("level"));
        }catch(NumberFormatException ex){
            error += "Chức vụ lựa chọn không đúng\n";
        }

        return level;
    }

    public String getAndValidateUsername(HttpServletRequest request){
        String username = "";
        username = request.getParameter("username");

        if(username == null || username.equalsIgnoreCase("")){
            error += "Username không được bỏ trống\n";
        }
        else if(username.length() > 40) {
            error += "Username chỉ chứa tối đa 40 kí tự\n";
        }
        else if(username.length() < 6){
            error += "Username phải có ít nhất 6 kí tự\n";
        }
        else{

            for(int i = 0; i < username.length(); i++){
                if(!(username.charAt(i) >= 48 && username.charAt(i) <= 57)
                    && !(username.charAt(i) >= 65 && username.charAt(i) <= 90)
                    && !(username.charAt(i) >= 97 && username.charAt(i) <= 122)){
                    error += "Username chỉ chứa (a-z, A-Z, 0-9)\n";
                    break;
                }
            }
        }

        return username;
    }

    public String getAndValidatePassword(HttpServletRequest request){
        String password = "";
        password = request.getParameter("password");

        if(password == null || password.equalsIgnoreCase("")){
            error += "Password không được bỏ trống\n";
        }
        else if(password.length() > 20) {
            error += "Password chỉ chứa tối đa 20 kí tự\n";
        }
        else if(password.length() < 6) {
            error += "Password phải chứa tối thiểu 6 kí tự\n";
        }
        else{
            for(int i = 0; i < password.length(); i++){
                if(!(password.charAt(i) >= 48 && password.charAt(i) <= 57)
                        && !(password.charAt(i) >= 65 && password.charAt(i) <= 90)
                        && !(password.charAt(i) >= 97 && password.charAt(i) <= 122)){
                    error += "Password chỉ chứa (a-z, A-Z, 0-9)\n";
                    break;
                }
            }
        }

        return password;
    }

    public void validateRepassword(String password, HttpServletRequest request){
        String repassword = "";
        repassword = request.getParameter("repassword");

        if(repassword == null || repassword.equalsIgnoreCase("")){
            error += "Repassword không được bỏ trống\n";
        }
        else{

            if(!repassword.equals(password))
                error += "Password không khớp nhau\n";
        }
    }

    public void validateDuplicateUsername(Connection connection, String username) throws ServletException {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String query = "SELECT id_user FROM User WHERE username = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null && resultSet.next()){
                error += "Username đã tồn tại\n";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }
}
