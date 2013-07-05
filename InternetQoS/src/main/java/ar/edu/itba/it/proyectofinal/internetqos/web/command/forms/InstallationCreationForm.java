package ar.edu.itba.it.proyectofinal.internetqos.web.command.forms;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.validation.Errors;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.InstallationRepository;

public class InstallationCreationForm {

	@NotEmpty(message="El nombre de la instalación no puede ser vacío")
	private String name;
	
	private Integer id;

	public InstallationCreationForm() {
	}

	public InstallationCreationForm(Installation installation) {
		setName(installation.getName());
		setId(installation.getId());
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public boolean validate(User u, Errors errors) {
		
		if (u.hasInstallation(name)) {
			errors.reject("installationExists");
		}
		return errors.hasErrors() ? false : true;
	}

	public Installation build(User u) {
		Installation i = new Installation(u, getName());
		return i;
	}

}
