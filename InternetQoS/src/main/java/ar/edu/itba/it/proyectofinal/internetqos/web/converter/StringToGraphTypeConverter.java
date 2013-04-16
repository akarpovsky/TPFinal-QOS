package ar.edu.itba.it.proyectofinal.internetqos.web.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import ar.edu.itba.it.proyectofinal.internetqos.domain.util.ChartType;

@Component
public class StringToGraphTypeConverter implements Converter<String, ChartType> {
	
	
	@Override
	public ChartType convert(String graphType) {
		return ChartType.createFromString(graphType);
	}
	

}
