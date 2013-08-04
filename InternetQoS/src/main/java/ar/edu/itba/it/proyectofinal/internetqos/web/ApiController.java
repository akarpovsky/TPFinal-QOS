package ar.edu.itba.it.proyectofinal.internetqos.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.UserType;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.InstallationRepository;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;

@Controller
public class ApiController {

	private UserRepository userRepo;
	private InstallationRepository installationRepo;

	@Autowired
	public ApiController(UserRepository userRepo,
			InstallationRepository installationRepo) {
		this.userRepo = userRepo;
		this.installationRepo = installationRepo;
	}
	
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody List<Installation> authenticate(@RequestParam(value="name") String name, @RequestParam(value="password") String password) {
		User user = userRepo.authenticate(name, password);
		if (user != null) {
			if(!user.getType().equals(UserType.ADMIN)){
				return user.getInstallations();
			}else{
				return new ArrayList<Installation>();
			}
		}
		return new ArrayList<Installation>();
	}
	
}
