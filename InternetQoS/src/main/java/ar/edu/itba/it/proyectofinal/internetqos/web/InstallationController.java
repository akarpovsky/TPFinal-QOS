package ar.edu.itba.it.proyectofinal.internetqos.web;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.InstallationRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.RecordRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.internetqos.web.command.forms.InstallationCreationForm;
import ar.edu.itba.it.proyectofinal.internetqos.web.util.ControllerUtil;

@Controller
public class InstallationController {

	private UserRepository userRepo;
	private RecordRepository recordRepo;
	private InstallationRepository installationRepo;

	@Autowired
	public InstallationController(UserRepository userRepo, RecordRepository recordRepo,
			InstallationRepository installationRepo) {
		this.userRepo = userRepo;
		this.recordRepo = recordRepo;
		this.installationRepo = installationRepo;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView newinstallation(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User me = getSessionUser(session);
		
		if (me == null) {
			mav.setView(ControllerUtil.redirectView("/login/login"));
			return mav;
		}
		
		if (me.getType().equals(UserType.ADMIN)) {
			mav.addObject("errorDescription",
					"No tiene permisos para acceder aquí.");
			mav.setViewName("error");
			return mav;
		}
		
		mav.addObject("installationCreationForm", new InstallationCreationForm());
		return mav;

	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView newinstallation(HttpSession session, @Valid InstallationCreationForm installationCreationForm, 
			Errors errors) {
		ModelAndView mav = new ModelAndView();
		User me = getSessionUser(session);
		
		if (me == null) {
			mav.setView(ControllerUtil.redirectView("/login/login"));
			return mav;
		}
		
		if (me.getType().equals(UserType.ADMIN)) {
			mav.addObject("errorDescription",
					"No tiene permisos para acceder aquí.");
			mav.setViewName("error");
			return mav;
		}

		if (errors.hasErrors() || !installationCreationForm.validate(me, errors)) {
			return null;
		}
		
		Installation newInstallation = installationCreationForm.build();
		installationRepo.add(newInstallation);
		me.addInstallation(newInstallation);
		mav.setView(ControllerUtil.redirectView("/user/dashboard"));
		return mav;

	}


	private User getSessionUser(HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		return (userId == null) ? null:userRepo.get(userId);
	}

	private String getDateString(DateTime timestamp) {
		String ans = timestamp.toString().substring(0, 10);
		System.out.println(ans);
		return ans;
	}

}
