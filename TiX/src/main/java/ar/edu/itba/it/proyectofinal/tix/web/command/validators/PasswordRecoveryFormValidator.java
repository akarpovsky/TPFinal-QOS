package ar.edu.itba.it.proyectofinal.tix.web.command.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ar.edu.itba.it.proyectofinal.tix.domain.util.AppError;
import ar.edu.itba.it.proyectofinal.tix.web.command.forms.PasswordRecoveryForm;

@Component
public class PasswordRecoveryFormValidator implements Validator{
	
	@Override
	public boolean supports(Class<?> clazz) {
		return PasswordRecoveryForm.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		PasswordRecoveryForm form = (PasswordRecoveryForm) target;
		if (!form.getPassword1().equals(form.getPassword2())) {
			errors.reject(AppError.PASSWD_DONT_MATCH.translationKey);
		}		
	}

}
