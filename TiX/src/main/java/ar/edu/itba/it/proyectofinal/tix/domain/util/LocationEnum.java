package ar.edu.itba.it.proyectofinal.tix.domain.util;


public enum LocationEnum {
	NO_ASIGNADO("Notebook (no asignado)"),
	BUENOS_AIRES("Buenos Aires"),
	GBA("Gran Buenos Aires"),
	CAPITAL_FEDERAL("Capital Federal"),
	CATAMARCA("Catamarca"),
	CHACO("Chaco"),
	CHUBUT("Chubut"),
	CORDOBA("Cordoba"),
	CORRIENTES("Corrientes"),
	ENTRE_RIOS("Entre Rios"),
	FORMOSA("Formosa"),
	JUJUY("Jujuy"),
	LA_PAMPA("La Pampa"),
	LA_RIOJA("La Rioja"),
	MENDOZA("Mendoza"),
	MISIONES("Misiones"),
	NEUQUEN("Neuquen"),
	RIO_NEGRO("Rio Negro"),
	SALTA("Salta"),
	SAN_JUAN("San Juan"),
	SAN_LUIS("San Luis"),
	SANTA_CRUZ("Santa Cruz"),
	SANTA_FE("Santa Fe"),
	SANTIAGO_DEL_ESTERO("Santiago del Estero"),
	TIERRA_DEL_FUEGO("Tierra del Fuego"),
	TUCUMAN("Tucuman");
	
	
	public final String translationKey;

	private LocationEnum(String translationKey) {
		this.translationKey = translationKey;
	}

	public String getTranslationKey() {
		return translationKey;
	}

	public static LocationEnum createFromString(String graphType) {
		if (graphType.equals("Buenos Aires"))
			return BUENOS_AIRES;
		else if (graphType.equals("Córdoba"))
			return CORDOBA;
		else if (graphType.equals("La Pampa"))
			return LA_PAMPA;
		else
			return NO_ASIGNADO;
	}
}