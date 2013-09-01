package ar.edu.itba.it.proyectofinal.tix.web.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Record;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.RecordRepository;

@Component
public class IdToRecordConverter implements Converter<String, Record> {
	
	private RecordRepository recordRepository;
	
	@Autowired
	public IdToRecordConverter(RecordRepository recordRepository) {
		this.recordRepository = recordRepository;
	}
	
	@Override
	public Record convert(String recordId) {
		return recordRepository.get(Integer.valueOf(recordId));
	}
	
	

}
