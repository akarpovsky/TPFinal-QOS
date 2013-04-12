package ar.edu.itba.it.proyectofinal.internetqos.domain.repository;

import java.util.List;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;


public interface RecordRepository {
	
	public void add(Record record);
	
	public List<? extends Record> getAll();

	public Record get(int id);

}
