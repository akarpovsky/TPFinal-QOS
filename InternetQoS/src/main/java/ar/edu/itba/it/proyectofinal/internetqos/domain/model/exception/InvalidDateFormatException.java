package ar.edu.itba.it.proyectofinal.internetqos.domain.model.exception;

public class InvalidDateFormatException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public InvalidDateFormatException() {
	}
	
	public InvalidDateFormatException(String message) {
		super(message);
	}
}
