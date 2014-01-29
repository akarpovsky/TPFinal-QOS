package ar.edu.itba.it.proyectofinal.tix.web.command.forms;

import org.hibernate.validator.constraints.Email;
import org.springframework.validation.Errors;

import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.model.UserBuilder;
import ar.edu.itba.it.proyectofinal.tix.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.tix.domain.model.UserValidator;
import ar.edu.itba.it.proyectofinal.tix.domain.model.exception.InvalidParametersException;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.util.AppError;
import ar.edu.itba.it.proyectofinal.tix.domain.util.ErrorUtil;

public class UserUpdateForm {

	@Email
	private String nickname;
	
	//private Integer birthyear;
	
	private String password1;


	public UserUpdateForm() {
	}

	public UserUpdateForm(User user) {
		setNickname(user.getNickname());
	//	setBirthyear(user.getBirthYear());
	}
	
//	public void setBirthyear(Integer birthyear) {
//		this.birthyear = birthyear;
//	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
//	public Integer getBirthyear() {
//		return birthyear;
//	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public void clearPasswords() {
		setPassword1(null);
	}

	public User build(Errors errors, UserRepository userRepo) {
		User user = null;
		if (userRepo.existsNickname(nickname)) {
			errors.reject("nicknameExists");
		}else{
			try {
				user = new User(nickname, password1, UserType.REGULAR);
			} catch (InvalidParametersException e) {
				ErrorUtil.rejectAll(errors, e.getErrors());
			}
		}
		return errors.hasErrors() ? null : user;
	}

	public void update(Errors errors, UserRepository userRepo, User user) {
		boolean passworchMatches = user.getPassword().equals(password1);
		if (!passworchMatches) {
			errors.reject(AppError.INCORRECT_PASSWORD.translationKey);
		}
		if (userRepo.existsNickname(nickname)) {
			errors.reject("nicknameExists");
		}
		UserValidator userValidator = new UserValidator();
		if (!userValidator.emailValid(nickname)) {
			errors.reject(AppError.NICKNAME.translationKey);
		}
		if (passworchMatches && !userValidator.passwordValid(password1)) {
			errors.reject(AppError.INVALID_PASSWORD.translationKey);
		}
		
//		if (!userValidator.birthyearValid(birthyear)) {
//			errors.reject(AppError.BIRTHYEAR.translationKey);
//		}
//		
		if (!errors.hasErrors()) {
			UserBuilder.build(user, nickname, user.getPassword(), user.getType());
		}
	}
}
