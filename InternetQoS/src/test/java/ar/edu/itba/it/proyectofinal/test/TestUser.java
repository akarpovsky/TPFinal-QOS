package ar.edu.itba.it.proyectofinal.test;

import org.joda.time.LocalDate;
import org.junit.Before;
import org.junit.Test;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.InvalidParametersException;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;

public class TestUser {
	
	User u1, u2;
	
	@Before
	public void setUp() {
		u1 = new User("nickname1", "NameOne", "SurnameOne", "test1@test.com", new LocalDate(), "password1");
		u2 = new User("nickname2", "NameTwo", "SurnameTwo", "test2@test.com", new LocalDate(), "password2");
	}
	
	@Test(expected=InvalidParametersException.class)
	public void testCreatingWithInvalidNickname() {
		new User(".lala", "Name", "Surname", "email@test.com", new LocalDate(), "asd");
	}
	
	@Test(expected=InvalidParametersException.class)
	public void testCreatingWithInvalidEmail() {
		new User("nickname", "Name", "Surname", "emailtest.com", new LocalDate(), "asd");
	}
	
}
