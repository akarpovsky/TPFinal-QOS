package ar.edu.itba.it.proyectofinal.tix.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.util.AppError;
import ar.edu.itba.it.proyectofinal.tix.web.command.forms.UserCreationForm;
import ar.edu.itba.it.proyectofinal.tix.web.command.forms.UserLoginForm;
import ar.edu.itba.it.proyectofinal.tix.web.util.ControllerUtil;

@Controller
public class LoginController {

	private UserRepository userRepo;

	@Autowired
	public LoginController(UserRepository userRepo) {
		this.userRepo = userRepo;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("userId") != null) {
			mav.setView(ControllerUtil.redirectView("/user/dashboard"));
			return mav;
		}
		mav.setViewName("login/login");
		mav.addObject("userLoginForm", new UserLoginForm());
		mav.addObject("userCreationForm", new UserCreationForm());
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, UserLoginForm userLoginForm, Errors errors) {
		ModelAndView mav = new ModelAndView();
		User user = userRepo.authenticate(userLoginForm.getNickname(), userLoginForm.getPassword());
		if (user != null) {
			session.setAttribute("userId", user.getId());
			if(user.getType().equals(UserType.ADMIN)){
				mav.setView(ControllerUtil.redirectView("/user/adminpanel"));
			}else{
				mav.setView(ControllerUtil.redirectView("/user/dashboard"));
			}
			return mav;
		}
		mav.addObject("userCreationForm", new UserCreationForm());
		userLoginForm.clearPassword();
		errors.rejectValue("nickname", AppError.LOGIN_FAILURE.translationKey);
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
