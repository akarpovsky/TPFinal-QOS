package ar.edu.itba.it.proyectofinal.tix.domain.model;

import ar.edu.itba.it.proyectofinal.tix.domain.model.exception.InvalidParametersException;


public class UserBuilder {

	public static void build(User user, String nickname, String password, UserType type) {
		InvalidParametersException ansException = new InvalidParametersException();
		try {
			user.setNickname(nickname);
		} catch (InvalidParametersException e) {
			ansException.addAll(e.getErrors());
		}
		
//		try {
//			user.setBirhYear(birthyear);
//		} catch (InvalidParametersException e) {
//			ansException.addAll(e.getErrors());
//		}

		try {
			user.setPassword(password);
		} catch (InvalidParametersException e) {
			ansException.addAll(e.getErrors());
		}
		
		try {
			user.setType(type);
		} catch (InvalidParametersException e) {
			ansException.addAll(e.getErrors());
		}

		if (ansException.hasErrors()) {
			throw ansException;
		}
	}
}
