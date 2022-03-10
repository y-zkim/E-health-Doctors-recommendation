package metier.dao.Implementations;

import java.util.List;


import org.hibernate.Session;
import metier.dao.beans.Langue;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class LangueDao implements functionStd<Langue, Long> {
	
	Session session = HibernateUtil.openSession();
	
	private static LangueDao instance = null;
	
	private LangueDao() {

	}
	
	@Override
	public Langue add(Langue a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public Langue edit(Langue a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Langue langue = getById(b);
		session.delete(langue);
		session.getTransaction().commit();
		
	}

	@Override
	public Langue getById(Long id) {
		return session.get(Langue.class, id);
	}

	@Override
	public List<Langue> getAll() {
		return session.createQuery("select o from Langue o").list();//SQL HQL
	}
	
	public static LangueDao getInsctance() {
		if (instance == null)
            instance = new LangueDao();
		return instance;
	}
}
