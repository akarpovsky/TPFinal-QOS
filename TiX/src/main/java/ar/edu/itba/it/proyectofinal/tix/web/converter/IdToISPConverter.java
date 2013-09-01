package ar.edu.itba.it.proyectofinal.tix.web.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import ar.edu.itba.it.proyectofinal.tix.domain.model.ISP;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.ISPRepository;

@Component
public class IdToISPConverter implements Converter<String, ISP> {
	
	private ISPRepository ispRepo;
	
	@Autowired
	public IdToISPConverter(ISPRepository ispRepo) {
		this.ispRepo = ispRepo;
	}
	
	@Override
	public ISP convert(String ispID) {
		System.out.println();
		return ispRepo.get(Integer.valueOf(ispID));
	}
	
	

}
