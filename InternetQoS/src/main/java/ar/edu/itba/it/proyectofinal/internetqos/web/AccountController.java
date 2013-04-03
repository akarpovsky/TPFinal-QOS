package ar.edu.itba.it.proyectofinal.internetqos.web;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.postgresql.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.forms.PasswordRecoveryCreationForm;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.forms.PasswordRecoveryForm;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.forms.PasswordUpdateForm;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.forms.UserCreationForm;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.forms.UserLoginForm;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.forms.UserUpdateForm;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.validators.PasswordRecoveryFormValidator;
import ar.edu.itba.it.proyectofinal.internetqos.web.util.ControllerUtil;

@Controller
public class AccountController {

	private static Logger logger = Logger.getLogger(AccountController.class);

	private UserRepository userRepo;

	private PasswordRecoveryFormValidator changePasswordFormValidator;

	@Autowired
	public AccountController(UserRepository userRepo) {
		this.userRepo = userRepo;
		this.changePasswordFormValidator = new PasswordRecoveryFormValidator();
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView register(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("userId") != null) {
			mav.setView(ControllerUtil.redirectView("/user/profile"));
			return mav;
		}
		mav.setViewName("account/register");
		mav.addObject("userCreationForm", new UserCreationForm());
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView register(UserCreationForm userCreationForm,
			Errors errors) {
		ModelAndView mav = new ModelAndView("account/register");
		User u = userCreationForm.build(errors, userRepo);
		if (errors.hasErrors()) {
			return mav;
		}
		userRepo.add(u);
		mav.setView(ControllerUtil.redirectView("/account/register"));
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView edit(HttpSession session) {
		User user = userRepo.get((Integer) session.getAttribute("userId"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", user);
		mav.addObject("passwordUpdateForm", new PasswordUpdateForm());
		mav.addObject("userUpdateForm", new UserUpdateForm(user));
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView edit(HttpSession session,
			UserUpdateForm userUpdateForm, Errors errors) {
		ModelAndView mav = new ModelAndView();
		User user = userRepo.get((Integer) session.getAttribute("userId"));
		userUpdateForm.update(errors, userRepo, user);
		if (!errors.hasErrors()) {
			userUpdateForm.clearPasswords();
		}
		mav.addObject("user", user);
		mav.addObject("passwordUpdateForm", new PasswordUpdateForm());
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET, value="recoverpassword")
	public ModelAndView recoverPassword(@RequestParam(value="cod")String cod) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("passwordRecoveryForm", new PasswordRecoveryForm());
		mav.addObject("cod", cod);
		mav.setViewName("account/recoverPassword");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView recoverPassword(@RequestParam(value="cod")String cod,
			PasswordRecoveryForm passwordRecoveryForm, Errors errors) {
		ModelAndView mav = new ModelAndView();
		changePasswordFormValidator.validate(passwordRecoveryForm, errors);
		if (errors.hasErrors()) {
			return null;
		}
		String decoded = new String(Base64.decode(cod));
		String[] array = decoded.split(":");
		String nickname = array[0];
		User u = userRepo.get(nickname);
		if ( u == null || u.recoverPassword(cod, passwordRecoveryForm.getPassword1())) {
			mav.setView(ControllerUtil.redirectView("/user/profile"));
		} else {
			mav.addObject("changePasswordFailed", true);
		}
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView changePassword(HttpSession session,
			PasswordUpdateForm passwordUpdateForm, Errors errors) {
		User me = userRepo.get((Integer) session.getAttribute("userId"));
		passwordUpdateForm.update(errors, me);
		ModelAndView mav = new ModelAndView();
		if (!errors.hasErrors()) {
			passwordUpdateForm.clearpasswords();
			mav.setView(ControllerUtil.redirectView("/account/edit"));
		} else {
			passwordUpdateForm.clearOriginalPassword();
			mav.addObject("userUpdateForm", new UserUpdateForm(me));
			mav.setViewName("account/edit");
		}
		return mav;
	}



	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView recover() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("passwordRecoveryForm",
				new PasswordRecoveryCreationForm());
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView recover(
			PasswordRecoveryCreationForm passwordRecoveryForm, Errors errors) {
		ModelAndView mav = new ModelAndView();
		User user = userRepo.get(passwordRecoveryForm.getNickname());
		if (user == null) {
			mav.addObject("userDoesntExist", "true");
			mav.addObject("passwordRecoveryForm", passwordRecoveryForm);
			return mav;
		}
		try {
			user.recoverPassword();
			mav.setView(ControllerUtil.redirectView("/user/profile"));
		} catch (MessagingException e) {
			mav.addObject("errorDescription",
					"Error: No se pudo enviar el mail");
			mav.setViewName("error");
		}
		return mav;
	}
}
