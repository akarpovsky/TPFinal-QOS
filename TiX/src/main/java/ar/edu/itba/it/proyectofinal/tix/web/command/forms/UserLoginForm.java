package ar.edu.itba.it.proyectofinal.tix.web.command.forms;

public class UserLoginForm {

	private String password;
	private String nickname;
	
	public String getNickname() {
		return nickname;
	}
	
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public void clearPassword() {
		setPassword(null);
	}
	
}
