package ar.edu.itba.it.proyectofinal.tix.domain.repository;

import java.util.List;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.tix.domain.model.Record;
import ar.edu.itba.it.proyectofinal.tix.domain.model.User;

public interface InstallationRepository {
	
	public void add(Installation installation);
	
	public List<? extends Installation> getAll();
	
	public Installation get(int id);

	boolean exists(Installation i);

}
