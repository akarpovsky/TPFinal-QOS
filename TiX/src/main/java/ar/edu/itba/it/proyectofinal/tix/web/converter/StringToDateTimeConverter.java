package ar.edu.itba.it.proyectofinal.tix.web.converter;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToDateTimeConverter implements Converter<String, DateTime> {

	@Override
	public DateTime convert(String source) {
		try {
			DateTimeFormatter formatter = DateTimeFormat.forPattern("d/M/yyyy");
			return DateTime.parse(source, formatter);
		} catch (IllegalArgumentException e) {
			return null;
		}
	}

}
