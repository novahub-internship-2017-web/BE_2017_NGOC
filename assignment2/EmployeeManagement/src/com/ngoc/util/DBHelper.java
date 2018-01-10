package com.ngoc.util;

import com.ngoc.model.*;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBHelper extends HttpServlet{
    static Logger logger = Logger.getLogger(DBHelper.class);

    public static void insertUser(Connection connection, String username, String password, int access) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "";

        try {
            query = "INSERT INTO User(username, password, access)\n" +
                    "VALUE (?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            preparedStatement.setInt(3, access);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static int getIdUser(Connection connection, String username) throws ServletException {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int idUser = 0;
        String query = "";

        try {
            query = "SELECT id_user FROM User WHERE username = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null && resultSet.next())
                idUser = resultSet.getInt(1);

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

        return idUser;
    }

    public static void updateUserInfoTable(Connection connection, int idUser, String fullname, int yearOfBirth, String country, double coefficientsSalary, int level) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query;
        try{
            query = "UPDATE User_info \n" +
                    "SET fullname = ?,\n" +
                    "    year_of_birth = ?,\n" +
                    "    country = ?,\n" +
                    "    coefficientsSalary = ?,\n" +
                    "    allowance = ?,\n" +
                    "    level = ?\n" +
                    "WHERE id_user = ?";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, fullname);
            preparedStatement.setInt(2, yearOfBirth);
            preparedStatement.setString(3, country);
            preparedStatement.setDouble(4, coefficientsSalary);
            preparedStatement.setDouble(5, StaffHelper.getAllowance(level));
            preparedStatement.setInt(6, level);
            preparedStatement.setInt(7, idUser);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void insertUserInfo(Connection connection, int idUser, int userAccess, String fullname, int yearOfBirth, String country, double coefficientsSalary, int level) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "";

        try {
            // insert user_info
            query = "INSERT INTO User_info\n" +
                    "VALUE (?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setString(2, fullname);
            preparedStatement.setInt(3, yearOfBirth);
            preparedStatement.setString(4, country);
            preparedStatement.setDouble(5, ((userAccess == User.STAFF_ACCESS) ? StaffHelper.getAllowance(level) : TeacherHelper.getAllowance(level)));
            preparedStatement.setDouble(6, coefficientsSalary);
            preparedStatement.setInt(7, level);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void insertUserInfoTableForStaff(Connection connection, int idUser, String fullname, int yearOfBirth, String country, double coefficientsSalary, int level) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "";

        try {
            // insert user_info
            query = "INSERT INTO User_info\n" +
                    "VALUE (?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setString(2, fullname);
            preparedStatement.setInt(3, yearOfBirth);
            preparedStatement.setString(4, country);
            preparedStatement.setDouble(5, StaffHelper.getAllowance(level));
            preparedStatement.setDouble(6, coefficientsSalary);
            preparedStatement.setInt(7, level);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void insertUserInfoTableForTeacher(Connection connection, int idUser, String fullname, int yearOfBirth, String country, double coefficientsSalary, int level) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "";

        try {
            // insert user_info
            query = "INSERT INTO User_info\n" +
                    "VALUE (?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setString(2, fullname);
            preparedStatement.setInt(3, yearOfBirth);
            preparedStatement.setString(4, country);
            preparedStatement.setDouble(5, TeacherHelper.getAllowance(level));
            preparedStatement.setDouble(6, coefficientsSalary);
            preparedStatement.setInt(7, level);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void insertStaffTable(Connection connection, int idUser, String department, int daysOfWork) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "";

        try {
            query = "INSERT INTO Staff(id_user, department, days_of_work)\n" +
                    "VALUE (?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setString(2, department);
            preparedStatement.setInt(3, daysOfWork);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void updateStaffTable(Connection connection, int idUser, String department, int daysOfWork) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query;
        try{
            query = "UPDATE Staff \n" +
                    "SET department = ?,\n" +
                    "    days_of_work = ?\n" +
                    "WHERE id_user = ?";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, department);
            preparedStatement.setInt(2, daysOfWork);
            preparedStatement.setInt(3, idUser);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void updateTeacherTable(Connection connection, int idUser, String major, int numberOfLessons) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query;
        try{
            query = "UPDATE Teacher \n" +
                    "SET major = ?,\n" +
                    "    number_of_lessons = ?\n" +
                    "WHERE id_user = ?";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, major);
            preparedStatement.setInt(2, numberOfLessons);
            preparedStatement.setInt(3, idUser);
            preparedStatement.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void insertTeacherTable(Connection connection, int idUser, String major, int numberOfLessons) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "";

        try {
            query = "INSERT INTO Teacher(id_user, major, number_of_lessons)\n" +
                    "VALUE (?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            preparedStatement.setString(2, major);
            preparedStatement.setInt(3, numberOfLessons);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static int deleteUser(Connection connection, int idUser) throws ServletException {
        PreparedStatement preparedStatement = null;
        int rowsUpdated = 0;
        String query = "";

        try{
            query = "UPDATE User \n" +
                    "SET active = FALSE \n" +
                    "WHERE id_user=?";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            rowsUpdated += preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        } finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

        return rowsUpdated;

    }

    public static Teacher getTeacher(Connection connection, int id) throws ServletException{
        Teacher teacher = new Teacher();

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String query = "SELECT User.id_user, User.access, fullname, year_of_birth, country, allowance, coefficientsSalary, level, major, number_of_lessons\n" +
                "FROM EmployeeDB.User_info\n" +
                "inner join EmployeeDB.Teacher\n" +
                "on User_info.id_user = Teacher.id_user\n" +
                "inner join EmployeeDB.User\n" +
                "on User_info.id_user = User.id_user\n" +
                "where Teacher.id_user = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null && resultSet.next()){
                teacher.setId(resultSet.getInt(1));
                teacher.setAccess(resultSet.getInt(2));
                teacher.setFullname(resultSet.getString(3));
                teacher.setYearOfBirth(resultSet.getInt(4));
                teacher.setCountry(resultSet.getString(5));
                teacher.setAllowance(resultSet.getDouble(6));
                teacher.setCoefficientsSalary(resultSet.getDouble(7));
                teacher.setLevel(resultSet.getInt(8));
                teacher.setMajor(resultSet.getString(9));
                teacher.setNumberOfLessons(resultSet.getInt(10));

                return teacher;
            }
            else{
                //TODO : resultSet = null
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

        return teacher;
    }

    public static ArrayList<Teacher> getListTeacherByFullname(Connection connection, String name) throws ServletException {
        ArrayList<Teacher> teacherList = new ArrayList<>();

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String query = "";

        try{
            query = "SELECT User_info.id_user, fullname, year_of_birth, country, major, level, allowance, number_of_lessons, coefficientsSalary, User.access FROM User_info\n" +
                    "inner join Teacher\n" +
                    "on User_info.id_user = Teacher.id_user\n" +
                    "inner join User\n" +
                    "on User.id_user = Teacher.id_user\n" +
                    "WHERE fullname LIKE '%" + name + "%' AND User.access=? AND User.active = TRUE";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, User.TEACHER_ACCESS);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null){
                while(resultSet.next()) {
                    Teacher newTeacher = new Teacher();
                    newTeacher.setId(resultSet.getInt(1));
                    newTeacher.setFullname(resultSet.getString(2));
                    newTeacher.setYearOfBirth(resultSet.getInt(3));
                    newTeacher.setCountry(resultSet.getString(4));
                    newTeacher.setMajor(resultSet.getString(5));
                    newTeacher.setLevel(resultSet.getInt(6));
                    newTeacher.setAllowance(resultSet.getDouble(7));
                    newTeacher.setNumberOfLessons(resultSet.getInt(8));
                    newTeacher.setCoefficientsSalary(resultSet.getDouble(9));
                    newTeacher.setAccess(resultSet.getInt(10));

                    teacherList.add(newTeacher);
                }
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

        return teacherList;
    }

    public static Staff getStaff(Connection connection, int id) throws ServletException {
        Staff staff = new Staff();

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String query = "SELECT User.id_user, User.access, fullname, year_of_birth, country, allowance, coefficientsSalary, level, department, days_of_work\n" +
                "FROM EmployeeDB.User_info\n" +
                "inner join EmployeeDB.Staff\n" +
                "on User_info.id_user = Staff.id_user\n" +
                "inner join EmployeeDB.User\n" +
                "on User_info.id_user = User.id_user\n" +
                "where Staff.id_user = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null && resultSet.next()){
                staff.setId(resultSet.getInt(1));
                staff.setAccess(resultSet.getInt(2));
                staff.setFullname(resultSet.getString(3));
                staff.setYearOfBirth(resultSet.getInt(4));
                staff.setCountry(resultSet.getString(5));
                staff.setAllowance(resultSet.getDouble(6));
                staff.setCoefficientsSalary(resultSet.getDouble(7));
                staff.setLevel(resultSet.getInt(8));
                staff.setDepartment(resultSet.getString(9));
                staff.setDaysOfWork(resultSet.getInt(10));

                return staff;
            }
            else{
                //TODO : resultSet = null
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

        return staff;
    }

    public static ArrayList<Staff> getListStaffByFullname(Connection connection, String name) throws ServletException {
        ArrayList<Staff> staffList = new ArrayList<>();

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String query = "";

        try{
            query = "SELECT User_info.id_user, fullname, year_of_birth, country, department, level, allowance, days_of_work, coefficientsSalary, User.access FROM User_info\n" +
                    "inner join Staff\n" +
                    "on User_info.id_user = Staff.id_user\n" +
                    "inner join User\n" +
                    "on User.id_user = Staff.id_user\n" +
                    "Where fullname LIKE '%" + name + "%' AND (User.access=? OR User.access=?) AND User.active = TRUE";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, User.ADMIN_ACCESS);
            preparedStatement.setInt(2, User.STAFF_ACCESS);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null){
                while(resultSet.next()) {
                    Staff newStaff = new Staff();
                    newStaff.setId(resultSet.getInt(1));
                    newStaff.setFullname(resultSet.getString(2));
                    newStaff.setYearOfBirth(resultSet.getInt(3));
                    newStaff.setCountry(resultSet.getString(4));
                    newStaff.setDepartment(resultSet.getString(5));
                    newStaff.setLevel(resultSet.getInt(6));
                    newStaff.setAllowance(resultSet.getDouble(7));
                    newStaff.setDaysOfWork(resultSet.getInt(8));
                    newStaff.setCoefficientsSalary(resultSet.getDouble(9));
                    newStaff.setAccess(resultSet.getInt(10));

                    staffList.add(newStaff);
                }
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

        return staffList;
    }

    public static User getUser(Connection connection, int idUser) throws ServletException {
        User user = new User();

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String query = "SELECT * FROM User WHERE id_user=?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null && resultSet.next()){
                user.setId(resultSet.getInt(1));
                user.setUsername(resultSet.getString(2));
                user.setPassword(resultSet.getString(3));
                user.setAccess(resultSet.getInt(4));
            }
            else{
                // id_user isn't in Database
                return null;
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }
        finally {
            try {
                resultSet.close();
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }

        return user;
    }

    public static User getUser(Connection connection, String username, String password) throws ServletException {
        User user = null;

        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement("select id_user, username, password, access, active from User where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if(rs != null && rs.next()){

                user = new User(rs.getInt("id_user"), rs.getString("username"), rs.getString("password"), rs.getInt("access"), rs.getBoolean("active"));
                logger.info("User found with details="+user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                rs.close();
                ps.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }

        }

        return user;
    }

    public static String getPassword(Connection connection, int idUser) throws ServletException {
        String password = null;

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        String query = "SELECT password FROM User WHERE id_user = ?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idUser);
            resultSet = preparedStatement.executeQuery();

            if(resultSet != null && resultSet.next()){
                password = resultSet.getString("password");
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

        return password;
    }

    public static void changePassword(Connection connection, int idUser, String password) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "UPDATE User\n" +
                       "SET password=?\n" +
                       "WHERE id_user=?";

        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, password);
            preparedStatement.setInt(2, idUser);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        }finally{
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void changeTypeOfEmployeeToStaff(Connection connection, int idUser) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "UPDATE User \n" +
                "SET access = ?\n" +
                "WHERE id_user = ?";

        try{
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, User.STAFF_ACCESS);
            preparedStatement.setInt(2, idUser);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }

    public static void changeTypeOfEmployeeToTeacher(Connection connection, int idUser) throws ServletException {
        PreparedStatement preparedStatement = null;
        String query = "UPDATE User \n" +
                "SET access = ?\n" +
                "WHERE id_user = ?";

        try{
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, User.TEACHER_ACCESS);
            preparedStatement.setInt(2, idUser);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            logger.error("Database connection problem");
            throw new ServletException("DB Connection problem.");
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                logger.error("SQLException in closing PreparedStatement or ResultSet");;
            }
        }
    }
}
