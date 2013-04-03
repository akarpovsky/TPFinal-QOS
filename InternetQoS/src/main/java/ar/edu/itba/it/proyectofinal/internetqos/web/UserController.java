package ar.edu.itba.it.proyectofinal.internetqos.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.internetqos.web.util.ControllerUtil;

@Controller
public class UserController {

	private UserRepository userRepo;
	
	@Autowired
	public UserController(UserRepository userRepo) {
		this.userRepo = userRepo;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(HttpSession session,
			@RequestParam(value = "nickname", defaultValue = "") String nickname) {
		ModelAndView mav = new ModelAndView();
		Integer userId = (Integer) session.getAttribute("userId");
		boolean isLoggedIn = userId != null;
		User reqProfile = userRepo.get(nickname);
		if (!isLoggedIn) {
			if (nickname.isEmpty()) {
				mav.setView(ControllerUtil.redirectView("/login/login"));
				return mav;
			}
			if (reqProfile == null) {
				mav.addObject("errorDescription", "Usuario no encontrado");
				mav.setViewName("error");
				return mav;
			}
		} else {
			if (reqProfile == null) {
				User me = userRepo.get(userId);
				mav.setView(ControllerUtil.redirectView("/user/dashboard?nickname=" + me.getNickname()));
				return mav;
			}
		}
		mav.addObject("user", reqProfile);
		return mav;
	}

	
	private int[] getDaysAheadList(){
		return new int[] {0,1, 2, 3, 5, 15, 30, 60, 90, 120, 365};
	}
}
