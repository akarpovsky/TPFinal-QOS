package ar.edu.itba.it.proyectofinal.internetqos.domain.model;

import org.joda.time.LocalDate;

public class UserBuilder {

	public static void build(User user, String nickname, String password) {
		InvalidParametersException ansException = new InvalidParametersException();
		try {
			user.setNickname(nickname);
		} catch (InvalidParametersException e) {
			ansException.addAll(e.getErrors());
		}

		try {
			user.setPassword(password);
		} catch (InvalidParametersException e) {
			ansException.addAll(e.getErrors());
		}

		if (ansException.hasErrors()) {
			throw ansException;
		}
	}
}
