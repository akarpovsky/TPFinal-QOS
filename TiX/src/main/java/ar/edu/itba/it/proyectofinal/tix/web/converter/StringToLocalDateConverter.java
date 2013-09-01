package ar.edu.itba.it.proyectofinal.tix.web.converter;

import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToLocalDateConverter implements Converter<String, LocalDate> {

	@Override
	public LocalDate convert(String source) {
		try {
			DateTimeFormatter formatter = DateTimeFormat.forPattern("d/M/yyyy");
			return LocalDate.parse(source, formatter);
		} catch (IllegalArgumentException e) {
			return null;
		}
	}

}
