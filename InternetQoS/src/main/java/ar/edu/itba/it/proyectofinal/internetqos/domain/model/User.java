package ar.edu.itba.it.proyectofinal.internetqos.domain.model;

import java.util.Collections;

import javax.mail.MessagingException;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.postgresql.util.Base64;

import ar.edu.itba.it.proyectofinal.internetqos.domain.service.MailBuilder;
import ar.edu.itba.it.proyectofinal.internetqos.domain.service.MailService;
import ar.edu.itba.it.proyectofinal.internetqos.domain.util.AppError;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class User extends DBPersistentObject {
	
	private static final UserValidator uv = new UserValidator();
	
	@Column(nullable=false, unique=true)
	private String nickname;

	@Column(nullable=false)
	private String firstName;
	
	@Column(nullable=false)
	private String lastName;
	
	@Column(nullable=false, unique=true)
	private String email;
	
	@Column(nullable=false)
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	private LocalDate birthdate;
	
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=true, unique=true)
	private String passwordRecoveryRequestCode;
	
	User() {
		// required by hibernate 
	}
	
	public User(String nickname, String firstName, String lastName, String email, LocalDate birthdate, String password) {
		this();
		UserBuilder.build(this, nickname, firstName, lastName, email, birthdate, password);
	}
	
	@Override
	public int hashCode() {
		return nickname.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null || !(obj instanceof User)) {
			return false;
		}
		User other = (User) obj;
		return nickname.equals(other.nickname);
	}

	@Override
	public String toString() {
		return nickname;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		if (!uv.nicknameValid(nickname)) {
			throw new InvalidParametersException(Collections.singletonList(AppError.NICKNAME));
		}
		this.nickname = nickname;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setName(String firstName) {
		if (!uv.nameValid(firstName)){
			throw new InvalidParametersException(Collections.singletonList(AppError.NAME));
		}
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		if (!uv.lastNameValid(lastName)) {
			throw new InvalidParametersException(Collections.singletonList(AppError.LAST_NAME));
		}
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		if (!uv.emailValid(email)) {
			throw new InvalidParametersException(Collections.singletonList(AppError.EMAIL));
		}
		this.email = email;
	}

	public LocalDate getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(LocalDate birthdate) {
		if (!uv.birthdateValid(birthdate)) {
			throw new InvalidParametersException(Collections.singletonList(AppError.INVALID_BIRTH_DATE));
		}
		this.birthdate = birthdate;
	}

	public String getPassword() {
		return password;
	}
	

	public void setPassword(String password) {
		if (!uv.passwordValid(password)) {
			throw new InvalidParametersException(Collections.singletonList(AppError.INVALID_PASSWORD));
		}
		this.password = password;
	}
	

	public boolean sendRecoveryMail(String code) throws MessagingException {
		return MailService.send(MailBuilder.buildUserRecoveryMail(this, code));
	}

	public void recoverPassword() throws MessagingException {
		String cod = getNickname() + ":" + System.currentTimeMillis() + ":" + getId();
		cod = Base64.encodeBytes(cod.getBytes());
		sendRecoveryMail(cod);
		passwordRecoveryRequestCode = cod;
		System.out.println(cod);
	}
	
	public String getPasswordRecoveryRequestCode() {
		return passwordRecoveryRequestCode;
	}
	
	public void setPasswordRecoveryRequestCode(String getPasswordRecoveryRequestCode) {
		this.passwordRecoveryRequestCode = getPasswordRecoveryRequestCode;
	}
	
	public boolean recoverPassword(String cod, String newPassword) {
		if ( passwordRecoveryRequestCode.equals(cod) ) {
			password = newPassword;
			passwordRecoveryRequestCode = null;
			return true;
		}
		return false;
	}
	
}
