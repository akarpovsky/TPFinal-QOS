package ar.edu.itba.it.proyectofinal.tix.domain.repository.hibernate;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.itba.it.proyectofinal.tix.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.model.exception.UserExistsException;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.UserRepository;

@Repository
public class HibernateUserRepository extends AbstractHibernateRepo implements UserRepository  {

	@Autowired
	public HibernateUserRepository(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public void add(User user) {
		if (exists("id", user.getId()) || exists("nickname", user.getNickname()) ) {
			throw new UserExistsException();
		}
		save(user);
	}
	
	private boolean exists(String attr, Object id) {
		return !find("from User where " + attr + " = ?", id).isEmpty();
	}
	
	@Override
	public List<? extends User> getAll() {
		return find("from User");
	}


	@Override
	public boolean existsNickname(String nickname) {
		return exists("nickname", nickname);
	}

	@Override
	public User get(String nickname) {
		List<User> users = find("from User where nickname = ?", nickname);
		if (users.size() == 0) {
			return null;
		}
		return users.get(0);
	}

	@Override
	public List<User> getMathcingUsersByNameOrSurname(String matchQuery) {
		if (matchQuery == null || matchQuery.isEmpty()) {
			return new LinkedList<User>();
		}
		return find("from User where lower(firstname) || ' ' || lower(lastname) like ?", "%" + matchQuery + "%");
	}

	@Override
	public User authenticate(String username, String password) {
		List<User> users = find("from User where nickname = ? and password = ?", username, password);
		if (users.size() == 0) {
			return null;
		}
		User me = users.get(0);
		return me;
	}
	
	@Override
	public boolean mailIsAvailable(String email) {
		return exists("email", email);
	}
	
	@Override
	public boolean nicknameIsAvailable(String nickname) {
		return exists("nickname", nickname);
	}

	@Override
	public User get(int id) {
		return get(User.class, id);
	}

}
