package ar.edu.itba.it.proyectofinal.tix.domain.repository.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.itba.it.proyectofinal.tix.domain.model.ISP;
import ar.edu.itba.it.proyectofinal.tix.domain.model.User;
import ar.edu.itba.it.proyectofinal.tix.domain.model.exception.ISPExistsException;
import ar.edu.itba.it.proyectofinal.tix.domain.repository.ISPRepository;

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


	@Override
	public void add(ISP isp) throws ISPExistsException  {
		if (exists("id", isp.getId()) ) {
			throw new ISPExistsException();
		}
		save(isp);
	}


	@Override
	public ISP get(String ispName) {
		List<ISP> isps = find("from ISP where name = ?", ispName);
		if (isps.size() == 0) {
			return null;
		}
		return isps.get(0);
	}
	
}
