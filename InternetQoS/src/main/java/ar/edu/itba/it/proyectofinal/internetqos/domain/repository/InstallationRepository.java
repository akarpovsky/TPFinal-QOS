package ar.edu.itba.it.proyectofinal.internetqos.domain.repository;

import java.util.List;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;

public interface InstallationRepository {
	
	public void add(Installation installation);
	
	public List<? extends Installation> getAll();
	
	public Installation get(int id);


}
