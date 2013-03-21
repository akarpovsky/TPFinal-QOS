package ar.edu.itba.it.proyectofinal.internetqos.web.command.forms;

import org.joda.time.LocalDate;
import org.springframework.validation.Errors;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.InvalidParametersException;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.UserBuilder;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.UserValidator;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.AppError;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.ErrorUtil;

public class UserUpdateForm {

	private String nickname;
	private String firstName;
	private String lastName;
	private String email;
	private LocalDate birthdate;
	private String password1;


	public UserUpdateForm() {
	}

	public UserUpdateForm(User user) {
		setNickname(user.getNickname());
		setFirstName(user.getFirstName());
		setLastName(user.getLastName());
		setEmail(user.getEmail());
		setBirthdate(user.getBirthdate());
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setBirthdate(LocalDate birthdate) {
		this.birthdate = birthdate;
	}

	public LocalDate getBirthdate() {
		return birthdate;
	}
	
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
		try {
			user = new User(nickname, firstName, lastName, email, birthdate, password1);
		} catch (InvalidParametersException e) {
			ErrorUtil.rejectAll(errors, e.getErrors());
		}
		if (userRepo.existsNickname(nickname)) {
			errors.reject("nicknameExists");
		}
		if (userRepo.existsEmail(email)) {
			errors.reject("emailExists");
		}
		return errors.hasErrors() ? null : user;
	}

	public void update(Errors errors, UserRepository userRepo, User user) {
		boolean passworchMatches = user.getPassword().equals(password1);
		if (!passworchMatches) {
			errors.reject(AppError.INCORRECT_PASSWORD.translationKey);
		}
		UserValidator userValidator = new UserValidator();
		if (!userValidator.nicknameValid(nickname)) {
			errors.reject(AppError.NICKNAME.translationKey);
		}
		if (!userValidator.nameValid(firstName)) {
			errors.reject(AppError.NAME.translationKey);
		}
		if (!userValidator.lastNameValid(lastName)) {
			errors.reject(AppError.LAST_NAME.translationKey);
		}
		if (!userValidator.emailValid(email)) {
			errors.reject(AppError.EMAIL.translationKey);
		}
		if (passworchMatches && !userValidator.passwordValid(password1)) {
			errors.reject(AppError.INVALID_PASSWORD.translationKey);
		}
		if (!userValidator.birthdateValid(birthdate)) {
			errors.reject(AppError.INVALID_BIRTH_DATE.translationKey);
		}
		if (!errors.hasErrors()) {
			UserBuilder.build(user, nickname, firstName, lastName, email, birthdate, user.getPassword());
		}
	}
}
