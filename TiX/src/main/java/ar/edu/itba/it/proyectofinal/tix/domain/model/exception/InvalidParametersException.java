package ar.edu.itba.it.proyectofinal.tix.domain.model.exception;

import java.util.ArrayList;
import java.util.List;

import ar.edu.itba.it.proyectofinal.tix.domain.util.AppError;

public class InvalidParametersException extends RuntimeException {
	
	private static final long serialVersionUID = 1L;
	
	private List<AppError> errors;
	
	public InvalidParametersException() {
		errors = new ArrayList<AppError>();
	}
	
	public InvalidParametersException(List<AppError> errors) {
		this.errors = errors;
	}
	
	public boolean hasErrors() {
		return !errors.isEmpty();
	}
	
	public List<AppError> getErrors(){
		return errors;
	}

	public void addError(AppError error) {
		errors.add(error);
	}

	public void addAll(List<AppError> errorsList) {
		for(AppError error: errorsList){
			errors.add(error);
		}
	}
}
