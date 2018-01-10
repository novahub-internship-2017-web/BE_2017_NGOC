package com.ngoc.model;

public class StaffHelper {
	public static final int HEAD_OF_DEPARTMENT_LEVEL = 1;
	public static final double HEAD_OF_DEPARTMENT_ALLOWANCE = 1000;
	public static final String HEAD_OF_DEPARTMENT_NAME = "Trưởng phòng";
	public static final int DEPUTY_OF_DEPARTMENT_LEVEL = 2;
	public static final double DEPUTY_OF_DEPARTMENT_ALLOWANCE = 600;
	public static final String DEPUTY_OF_DEPARTMENT_NAME = "Phó phòng";
	public static final int STAFF_LEVEL = 3;
	public static final double STAFF_ALLOWANCE = 400;
	public static final String STAFF_NAME = "Nhân viên";
	public static final int ADMIN_LEVEL = 4;
	public static final String ADMIN_NAME = "Admin";
	public static final double ADMIN_ALLOWANCE = 1000;

    public static String getNameLevel(int level){
        String name = "";
        switch (level){
            case HEAD_OF_DEPARTMENT_LEVEL:
                name = HEAD_OF_DEPARTMENT_NAME;
                break;

            case DEPUTY_OF_DEPARTMENT_LEVEL:
                name = DEPUTY_OF_DEPARTMENT_NAME;
                break;

            case STAFF_LEVEL:
                name = STAFF_NAME;
                break;

            case ADMIN_LEVEL:
                name = ADMIN_NAME;
                break;
        }

        return name;
    }

    public static double getAllowance(int level){
        double allowance = 0;

        switch (level){
            case HEAD_OF_DEPARTMENT_LEVEL:
                allowance = HEAD_OF_DEPARTMENT_ALLOWANCE;
                break;

            case DEPUTY_OF_DEPARTMENT_LEVEL:
                allowance = DEPUTY_OF_DEPARTMENT_ALLOWANCE;
                break;

            case STAFF_LEVEL:
                allowance = STAFF_ALLOWANCE;
                break;

            case ADMIN_LEVEL:
                allowance = ADMIN_ALLOWANCE;
                break;
        }

        return allowance;
    }
}
