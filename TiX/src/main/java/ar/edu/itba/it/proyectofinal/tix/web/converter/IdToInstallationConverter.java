package ar.edu.itba.it.proyectofinal.tix.web.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.InstallationRepository;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;

@Component
public class IdToInstallationConverter implements Converter<String, Installation> {
	
	private InstallationRepository installationRepository;
	
	@Autowired
	public IdToInstallationConverter(InstallationRepository installationRepository) {
		this.installationRepository = installationRepository;
	}
	
	@Override
	public Installation convert(String installationId) {
		System.out.println();
		return installationRepository.get(Integer.valueOf(installationId));
	}
	
	

}
