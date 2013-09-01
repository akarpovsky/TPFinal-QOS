package ar.edu.itba.it.proyectofinal.tix.web.command.forms;

import org.springframework.validation.Errors;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.InstallationRepository;

public class InstallationEditForm extends InstallationCreationForm{

	public InstallationEditForm() {
	}
	
	public InstallationEditForm(Installation i) {
		super(i);
	}
	public boolean update(User user, InstallationRepository installationRepo, Errors errors) {
		Installation i = installationRepo.get(getId());
		if(!i.getName().equals(getName()) && user.hasInstallation(getName())){
			errors.reject("installationExists");
			return false;
		}
		else if(!user.hasInstallation(i)){
			errors.reject("nonUserInstallation");
			return false;
		}else{
			Installation userInstallation = user.getInstallation(i);
			userInstallation.setName(getName());
			return true;
		}
	}
	
}
