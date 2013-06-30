package ar.edu.itba.it.proyectofinal.internetqos.domain.repository.hibernate;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.ISP;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.ISPRepository;

@Repository
public class HibernateISPRepository extends AbstractHibernateRepo implements ISPRepository  {

	@Autowired
	public HibernateISPRepository(SessionFactory sessionFactory) {
		super(sessionFactory);
	}


	@Override
	public ISP get(int id) {
		return get(ISP.class, id);
	}
	
	private boolean exists(String attr, Object id) {
		return !find("from ISP where " + attr + " = ?", id).isEmpty();
	}
	
}
