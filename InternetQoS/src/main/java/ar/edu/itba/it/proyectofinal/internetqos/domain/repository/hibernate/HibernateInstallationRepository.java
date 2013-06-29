package ar.edu.itba.it.proyectofinal.internetqos.domain.repository.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Installation;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.exception.InstallationExistsException;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.InstallationRepository;

@Repository
public class HibernateInstallationRepository extends AbstractHibernateRepo implements InstallationRepository  {

	@Autowired
	public HibernateInstallationRepository(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public void add(Installation installation) {
		if (exists("id", installation.getId()) ) {
			throw new InstallationExistsException();
		}
		save(installation);
	}
	
	private boolean exists(String attr, Object id) {
		return !find("from Installation where " + attr + " = ?", id).isEmpty();
	}
	
	@Override
	public List<? extends Installation> getAll() {
		return find("from Installation");
	}

	@Override
	public Installation get(int id) {
		return get(Installation.class, id);
	}

	
}
