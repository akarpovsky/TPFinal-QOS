package ar.edu.itba.it.proyectofinal.internetqos.domain.util;

public enum AppError {
	EMAIL("invalidEmail"),
	PASSWD_DONT_MATCH("passwordDontMatch"),
	NICKNAME("invalidNickname"),
	NAME("invalidName"),
	LAST_NAME("invalidSurname"),
	INVALID_PASSWORD("invalidPasswd"),
	INCORRECT_PASSWORD("incorrectPasswd"),
	INVALID_BIRTH_DATE("invalidBirthDate"),
	USEREXISTS("userExists"),
	EMAILEXISTS("emailExists"),
	NICKNAMEEXISTS("nicknameExists"),
	EMPTY_PUBLICATION("publicationCantBeEmpty"),
	PUBLICATION_LEN("publicationTooLong"), 
	LOGIN_FAILURE("invalidCredentials"), 
	INVALID_IMAGE_TYPE("invalidImageType"), 
	INVALID_IMAGE_SIZE("invalidImageSize"), 
	IMAGE_UPLOAD_UNKNOWN("errorUploadingImage"),
	USERS_ARE_NOT_FRIENDS("usersAreNotFriends"), 
	USER_NOT_EXISTS("userNotExists"), 
	COMMENT_NOT_EXISTS("commentNotExists"), 
	USER_CANT_DELETE_COMMENT("userCantDeleteComment"),
	EVENT_NAME("invalidEventName"),
	EVENT_DESCRIPTION("invalidEventDescription"),
	EVENT_DATE("invalidEventDate"), 
	EVENT_GUESTS("invalidEventGuests"), EVENT_OWNER("invalidEventOwner"), INVALID_DAYS_AHEAD("invalidDaysAhead");
	
	public final String translationKey;
	
	private AppError(String translationKey) {
		this.translationKey = translationKey;
	}
	
	public String getTranslationKey(){
		return translationKey;
	}
}