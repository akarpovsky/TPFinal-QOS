package ar.edu.itba.it.proyectofinal.tix.web;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.InstallationRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.RecordRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.util.LocationEnum;
import ar.edu.itba.it.proyectofinal.tix.web.command.forms.InstallationCreationForm;
import ar.edu.itba.it.proyectofinal.tix.web.command.forms.InstallationEditForm;
import ar.edu.itba.it.proyectofinal.tix.web.util.ControllerUtil;

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
		
		mav.addObject("noInstallations", me.getInstallations().isEmpty());
		mav.addObject("installationLocations", LocationEnum.values());
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
		
		Installation newInstallation = installationCreationForm.build(me);
		installationRepo.add(newInstallation);
		me.addInstallation(newInstallation);
		mav.setView(ControllerUtil.redirectView("/installation/downloadapp?ins=" + newInstallation.getId()));
		return mav;

	}
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView downloadapp(HttpSession session,
			@RequestParam(value="ins", required=false) Installation installation) {
		ModelAndView mav = new ModelAndView();
		if(installation != null && !getSessionUser(session).hasInstallation(installation) ){
			mav.addObject("errorDescription",
					"No puede ver instalaciones que no le pertenecen.");
			mav.setViewName("error");
			return mav;
		}
		mav.addObject("installation", installation);
		return mav;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView setAsDefaultInstallation(HttpSession session, @RequestParam(value="id", required=true) Installation i) {
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
		
		if(i == null || (i != null && !me.hasInstallation(i))){
			mav.addObject("errorDescription",
					"No puede editar instalaciones que no le pertenecen.");
			mav.setViewName("error");
			return mav;
		}
		
		me.setDefaultInstallation(i);
		
		mav.setView(ControllerUtil.redirectView("/user/dashboard"));
		return mav;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView allinstallations(HttpSession session) {
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
		
		mav.addObject("user",me);
		mav.addObject("installationsList", me.getInstallations());
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView edit(HttpSession session, @RequestParam(value="id", required=true) Installation i) {
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
		
		if(i == null || (i != null && !me.hasInstallation(i))){
			mav.addObject("errorDescription",
					"No puede editar instalaciones que no le pertenecen.");
			mav.setViewName("error");
			return mav;
		}
		
		mav.addObject("installationEditForm", new InstallationEditForm(i));
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView edit(HttpSession session, 
		@Valid InstallationEditForm installationEditForm,
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
		
		if (errors.hasErrors() || !installationEditForm.update(me, installationRepo, errors)) {
			mav.addObject("installationEditForm", installationEditForm);
			mav.addObject("errors", errors);
			return null;
		}
		
		mav.setView(ControllerUtil.redirectView("/installation/allinstallations"));
		mav.addObject("userFeedbackLabel", "Instalacion actualizada exitosamente");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView delete(HttpSession session, @RequestParam(value="id", required=true) Installation installation) {
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
		
		if(installation == null || (installation != null && !me.hasInstallation(installation))){
			mav.addObject("errorDescription",
					"No puede eliminar instalaciones que no le pertenecen.");
			mav.setViewName("error");
			return mav;
		}
		
		recordRepo.removeAll(installation);
		me.deleteInstallation(installation);
		mav.setView(ControllerUtil.redirectView("/installation/allinstallations"));
		mav.addObject("userFeedbackLabel", "Instalacion eliminada exitosamente");
		return mav;
	}

	private User getSessionUser(HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		return (userId == null) ? null:userRepo.get(userId);
	}

}
