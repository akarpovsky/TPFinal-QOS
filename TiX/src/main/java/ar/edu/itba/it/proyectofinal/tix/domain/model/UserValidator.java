package ar.edu.itba.it.proyectofinal.tix.domain.model;

import org.joda.time.LocalDate;

public class UserValidator {
	
	private static final int NICKNAME_LENTGH = 40;
	private static final int NAME_LENTGH = 40;
	private static final int lastName_LENTGH = 40;
	private static final int PASSWORD_LENTGH = 40;
	
	public boolean emailValid(String email) {
		return email.matches("[A-Za-z0-9\\._\\-%\\+]+@[A-Za-z0-9\\-\\.]+\\.[A-Za-z]{2,4}");
	}

//	public boolean birthdateValid(LocalDate date) {
//		return date != null;
//	}

	public boolean nameValid(String firstName) {
		return genericStringValid(firstName, NAME_LENTGH, "[A-Za-z][A-Za-z\\s]*");
	}

	public boolean lastNameValid(String lastName) {
		return genericStringValid(lastName, lastName_LENTGH, "[A-Za-z][A-Za-z\\s]*");
	}

	public boolean passwordValid(String password) {
		return genericStringValid(password, PASSWORD_LENTGH, ".+");
	}

	private boolean genericStringValid(String field, int fieldLength, String pattern) {
		if (field == null)
			return false;
		if (field.length() > fieldLength)
			return false;
		return field.matches(pattern);
	}

	public boolean daysAheadToShowBDaysValid(int days) {
		return days >= 0;
	}

//	public boolean birthyearValid(int birthyear) {
//		return birthyear > 1900 && birthyear < 2100;
//	}
}
