package ar.edu.itba.it.proyectofinal.tix.domain.model;


public enum UserType {
	ADMIN("ADMIN"), REGULAR("REGULAR");
	public final String translationKey;

	private UserType(String translationKey) {
		this.translationKey = translationKey;
	}

	public String getTranslationKey() {
		return translationKey;
	}
}