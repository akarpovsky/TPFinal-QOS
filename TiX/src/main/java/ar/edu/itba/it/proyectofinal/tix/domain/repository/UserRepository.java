package ar.edu.itba.it.proyectofinal.tix.domain.repository;

import java.util.List;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.tix.domain.model.User;

public interface UserRepository {
	
	public void add(User user);
	
	public List<? extends User> getAll();

	public boolean existsNickname(String nickname);
	
	public User get(String nickname);
	
	public User get(int id);

	public List<User> getMathcingUsersByNameOrSurname(String matchQuery);
	
	public User authenticate(String username, String password);
	
	public boolean mailIsAvailable(String email);

	public boolean nicknameIsAvailable(String nickname);

}
