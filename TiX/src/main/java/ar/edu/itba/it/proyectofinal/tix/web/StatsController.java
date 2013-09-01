package ar.edu.itba.it.proyectofinal.tix.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.RecordRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.util.AppError;
import ar.edu.itba.it.proyectofinal.tix.web.command.forms.UserCreationForm;
import ar.edu.itba.it.proyectofinal.tix.web.command.forms.UserLoginForm;
import ar.edu.itba.it.proyectofinal.tix.web.util.ControllerUtil;

@Controller
public class StatsController {

	private RecordRepository recordsRepo;
	
	@Autowired
	public StatsController(RecordRepository recordsRepo) {
		this.recordsRepo = recordsRepo;
	}
	
}
