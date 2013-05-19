package ar.edu.itba.it.proyectofinal.internetqos.web.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.UserRepository;

@Component
public class IdToInstallationConverter implements Converter<String, Installation> {
	
	private UserRepository userRepository;
	
	@Autowired
	public IdToInstallationConverter(UserRepository userRepository) {
		this.userRepository = userRepository;
	}
	
	@Override
	public Installation convert(String installationId) {
		return userRepository.getInstallation(Integer.valueOf(installationId));
	}
	
	

}
