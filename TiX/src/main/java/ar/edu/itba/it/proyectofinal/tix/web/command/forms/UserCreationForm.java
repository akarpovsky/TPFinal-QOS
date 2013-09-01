package ar.edu.itba.it.proyectofinal.tix.web.command.forms;

import org.springframework.validation.Errors;

import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;

public class UserCreationForm extends UserUpdateForm {

	private String password2;
	
	public UserCreationForm() {
	}
		
	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	public void clearPasswords() {
		super.clearPasswords();
		setPassword2(null);
	}

	@Override
	public User build(Errors errors, UserRepository userRepo) {
		User user = super.build(errors, userRepo);
		if (!errors.hasFieldErrors("password1") && !errors.hasFieldErrors("password2")) {
			if (!password2.equals(getPassword1())) {
				errors.reject("passwordDontMatch");
			}
		}
		return user;
	}
	
	public void update(Errors errors, UserRepository userRepo, User user) {
		super.update(errors, userRepo, user);
		if (!errors.hasFieldErrors("password1") && !errors.hasFieldErrors("password2")) {
			if (!getPassword1().equals(password2)) {
				errors.reject("passwordDontMatch");
			}
		}
	}
	
}
