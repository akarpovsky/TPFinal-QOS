package ar.edu.itba.it.proyectofinal.internetqos.domain.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.mail.MessagingException;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.validator.constraints.Email;
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
	
//	@OneToMany(fetch=FetchType.LAZY) // Lazy loading
//	@JoinColumn(name="record_id", nullable=false)
//	@Cascade(org.hibernate.annotations.CascadeType.DELETE_ORPHAN)
//	private List<Record> records = new ArrayList<Record>();

	@Email
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=true, unique=true)
	private String passwordRecoveryRequestCode;
	
	@Enumerated(EnumType.STRING)
	@Column(nullable=false)
	private UserType type;
	
	User() {
		// required by hibernate 
	}
	
	public User(String nickname, String password, UserType type) {
		this();
		UserBuilder.build(this, nickname, password, type);
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
		if (!uv.emailValid(nickname)) {
			throw new InvalidParametersException(Collections.singletonList(AppError.NICKNAME));
		}
		this.nickname = nickname;
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
	
	public UserType getType() {
		return type;
	}

	public void setType(UserType type) {
		this.type = type;
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
