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
	public ModelAndView profile(HttpSession session,
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
				mav.setView(ControllerUtil.redirectView("/user/profile?nickname=" + me.getNickname()));
				return mav;
			}
		}
		mav.addObject("user", reqProfile);
		return mav;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView search(HttpSession session, @RequestParam("query") String query) {
		User me = userRepo.get((Integer) session.getAttribute("userId"));
		List<User> users = userRepo.getMathcingUsersByNameOrSurname(query);
//		Map<User, FriendshipStatus> searchResultMap = new HashMap<User, FriendshipStatus>();
		/*for (User r : users) {
			if (me.equals(r)) {
				searchResultMap.put(r, FriendshipStatus.MYSELF);
			} else if (me.isFriendOf(r)) {
				// His friend is my friend
				searchResultMap.put(r, FriendshipStatus.FRIENDS);
			} else if (userRepo.existsRequest(r, me, FriendRequest.class)) {
				// friendship request waiting here...
				searchResultMap.put(r, FriendshipStatus.FRIENDSHIP_REQUEST_PENDING);
			} else if (userRepo.existsRequest(me, r, FriendRequest.class)) {
				// He wants to be my friend
				searchResultMap.put(r, FriendshipStatus.REVERSE_FRIENDSHIP_REQUEST_PENDING);
			} else {
				searchResultMap.put(r, FriendshipStatus.NOT_FRIENDS);
			}
		}*/
		ModelAndView mav = new ModelAndView();
//		mav.addObject("searchResultMap", searchResultMap);
		mav.setViewName("user/search");
		return mav;
	}
	
	
	private int[] getDaysAheadList(){
		return new int[] {0,1, 2, 3, 5, 15, 30, 60, 90, 120, 365};
	}
}
