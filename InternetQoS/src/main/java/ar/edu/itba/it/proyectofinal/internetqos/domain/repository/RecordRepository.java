package ar.edu.itba.it.proyectofinal.internetqos.domain.repository;

import java.util.List;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.ISP;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;


public interface RecordRepository {
	
	public void add(Record record);
	
	public List<? extends Record> getAll();
	
	public List<? extends Record> getAll(User user, Installation installation);
	
//	public List<? extends Record> getAllForISP(User user, Installation installation, ISP isp);
	
	public Record get(int id);

}
