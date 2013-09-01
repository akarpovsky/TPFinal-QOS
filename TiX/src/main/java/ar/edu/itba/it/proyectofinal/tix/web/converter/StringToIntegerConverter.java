package ar.edu.itba.it.proyectofinal.tix.web.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToIntegerConverter implements Converter<String, Integer> {

	@Override
	public Integer convert(String source) {
		try {
			return Integer.valueOf(source);
		} catch (Exception e) {
			return null;
		}
	}

}
