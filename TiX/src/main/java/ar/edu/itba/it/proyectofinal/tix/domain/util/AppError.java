package ar.edu.itba.it.proyectofinal.tix.domain.util;

public enum AppError {
	EMAIL("invalidEmail"),
	PASSWD_DONT_MATCH("passwordDontMatch"),
//	BIRTHYEAR("invalidBirthYear"),
	NICKNAME("invalidNickname"),
	NAME("invalidName"),
	LAST_NAME("invalidSurname"),
	INVALID_PASSWORD("invalidPasswd"),
	INCORRECT_PASSWORD("incorrectPasswd"),
	INVALID_BIRTH_DATE("invalidBirthDate"),
	USEREXISTS("userExists"),
	EMAILEXISTS("emailExists"),
	NICKNAMEEXISTS("nicknameExists"),
	LOGIN_FAILURE("invalidCredentials"), 
	INVALID_IMAGE_TYPE("invalidImageType"), 
	INVALID_IMAGE_SIZE("invalidImageSize"), 
	IMAGE_UPLOAD_UNKNOWN("errorUploadingImage"),
	USER_NOT_EXISTS("userNotExists"),
	DEFAULT_INSTALLATION_NOT_MINE("defaultInstallationNotMine"),
	INVALID_DAYS_AHEAD("invalidDaysAhead");
	
	public final String translationKey;
	
	private AppError(String translationKey) {
		this.translationKey = translationKey;
	}
	
	public String getTranslationKey(){
		return translationKey;
	}
}