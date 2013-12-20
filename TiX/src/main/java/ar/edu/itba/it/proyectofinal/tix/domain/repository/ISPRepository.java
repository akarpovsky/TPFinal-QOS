package ar.edu.itba.it.proyectofinal.tix.domain.repository;

import ar.edu.itba.it.proyectofinal.tix.domain.model.ISP;
import ar.edu.itba.it.proyectofinal.tix.domain.model.exception.ISPExistsException;


public interface ISPRepository {
	
	public void add(ISP isp) throws ISPExistsException;
	
//	public List<? extends ISP> getAll();
	
//	public List<? extends Record> getAll(User user, Installation installation);
	
//	public List<? extends Record> getAllForISP(User user, Installation installation, ISP isp);
	
	public ISP get(int id);
	
	public ISP get(String ispName);

}
