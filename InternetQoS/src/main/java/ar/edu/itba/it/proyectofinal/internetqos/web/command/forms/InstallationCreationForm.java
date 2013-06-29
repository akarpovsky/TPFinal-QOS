package ar.edu.itba.it.proyectofinal.internetqos.web.command.forms;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.validation.Errors;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;

public class InstallationCreationForm {

	@NotEmpty(message="El nombre de la instalación no puede ser vacío")
	private String name;

	public InstallationCreationForm() {
	}

	public InstallationCreationForm(Installation installation) {
		setName(installation.getName());
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public boolean validate(User u, Errors errors) {
		
		if (u.hasInstallation(name)) {
			errors.reject("installationExists");
		}
		return errors.hasErrors() ? false : true;
	}

	public Installation build() {
		Installation i = new Installation(getName());
		return i;
	}

	//	public void update(Errors errors, UserRepository userRepo, User user) {
//		boolean passworchMatches = user.getPassword().equals(password1);
//		if (!passworchMatches) {
//			errors.reject(AppError.INCORRECT_PASSWORD.translationKey);
//		}
//		UserValidator userValidator = new UserValidator();
//		if (!userValidator.emailValid(name)) {
//			errors.reject(AppError.NICKNAME.translationKey);
//		}
//		if (passworchMatches && !userValidator.passwordValid(password1)) {
//			errors.reject(AppError.INVALID_PASSWORD.translationKey);
//		}
//		
//		if (!userValidator.birthyearValid(birthyear)) {
//			errors.reject(AppError.BIRTHYEAR.translationKey);
//		}
//		
//		if (!errors.hasErrors()) {
//			UserBuilder.build(user, name, user.getPassword(), birthyear, user.getType());
//		}
//	}
	
}
