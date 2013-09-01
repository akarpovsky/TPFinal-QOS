package ar.edu.itba.it.proyectofinal.tix.web.command.forms;

import org.springframework.validation.Errors;

import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.util.AppError;


public class PasswordUpdateForm {

	private String originalPassword;
	private String newPassowrd;
	
	public void setOriginalPassword(String originalPassword) {
		this.originalPassword = originalPassword;
	}
	
	public String getOriginalPassword() {
		return originalPassword;
	}
	
	public void setNewPassword(String newPassord) {
		this.newPassowrd = newPassord;
	}
	
	public String getNewPassword() {
		return newPassowrd;
	}

	public void update(Errors errors, User user) {
		if (!originalPassword.equals(user.getPassword())) {
			errors.reject(AppError.PASSWD_DONT_MATCH.translationKey);
		}
		if (!errors.hasErrors()) {
			user.setPassword(newPassowrd);
		}
	}
	
	public void clearOriginalPassword() {
		setOriginalPassword(null);
	}
	
	public void clearpasswords() {
		setOriginalPassword(null);
		setNewPassword(null);
	}
	
}
