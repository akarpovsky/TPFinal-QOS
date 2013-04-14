package ar.edu.itba.it.proyectofinal.internetqos.domain.repository.hibernate;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.itba.it.proyectofinal.internetqos.domain.model.Record;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.User;
import ar.edu.itba.it.proyectofinal.internetqos.domain.model.UserExistsException;
import ar.edu.itba.it.proyectofinal.internetqos.domain.repository.RecordRepository;

@Repository
public class HibernateRecordRepository extends AbstractHibernateRepo implements RecordRepository  {

	@Autowired
	public HibernateRecordRepository(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public void add(Record record) {
		if (exists("id", record.getId()) ) {
			throw new UserExistsException();
		}
		save(record);
	}
	
	
	@Override
	public List<? extends Record> getAll() {
		return find("from Record");
	}
	

	public List<? extends Record> getAll(User user) {
		return find("from Record r where user_id = ? order by r.timestamp desc ", user.getId());
	}


	@Override
	public Record get(int id) {
		return get(Record.class, id);
	}
	
	private boolean exists(String attr, Object id) {
		return !find("from Record where " + attr + " = ?", id).isEmpty();
	}

	
}
