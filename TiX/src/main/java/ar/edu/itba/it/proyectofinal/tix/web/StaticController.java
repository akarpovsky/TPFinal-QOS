package ar.edu.itba.it.proyectofinal.tix.web;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StaticController {

	private static Logger logger = Logger.getLogger(StaticController.class);


	public StaticController() {
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView about(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("static/about");
		return mav;
	}
}
