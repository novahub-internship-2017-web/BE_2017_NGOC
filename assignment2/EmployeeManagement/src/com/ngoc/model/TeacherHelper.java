package com.ngoc.model;

public class TeacherHelper {
	public static final int BACHELOR_LEVEL = 1;
	public static final double BACHELOR_ALLOWANCE = 300;
	public static final String BACHELOR_NAME = "Cử nhân";
	public static final int MATER_LEVEL = 2;
	public static final double MATER_ALLOWANCE = 900;
	public static final String MATER_NAME = "Thạc sĩ";
	public static final int DOCTOR_OF_PHILOSOPHY_LEVEL = 3;
	public static final double DOCTOR_OF_PHILOSOPHY_ALLOWANCE = 2000;
	public static final String DOCTOR_OF_PHILOSOPHY_NAME = "Tiến sĩ";
	
	public TeacherHelper() {
		super();
	}

	public static String getNameLevel(int level){
		String name = "";
		switch (level){
			case BACHELOR_LEVEL:
				name = BACHELOR_NAME;
			break;

			case MATER_LEVEL:
				name = MATER_NAME;
			break;

			case DOCTOR_OF_PHILOSOPHY_LEVEL:
				name = DOCTOR_OF_PHILOSOPHY_NAME;
			break;
		}

		return name;
	}

	public static double getAllowance(int level){
		double allowance = 0;

		switch (level){
			case BACHELOR_LEVEL:
				allowance = BACHELOR_ALLOWANCE;
				break;

			case MATER_LEVEL:
				allowance = MATER_ALLOWANCE;
				break;

			case DOCTOR_OF_PHILOSOPHY_LEVEL:
				allowance = DOCTOR_OF_PHILOSOPHY_ALLOWANCE;
				break;
		}

		return allowance;
	}
}
