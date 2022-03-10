package metier.dao.Implementations;

import java.util.List;


import org.hibernate.Session;
import metier.dao.beans.Recomponse;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class RecompenceDao implements functionStd<Recomponse, Long> {

Session session = HibernateUtil.openSession();
	
	private static RecompenceDao instance = null;
	
	private RecompenceDao() {

	}
	
	@Override
	public Recomponse add(Recomponse a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		session.close();
		return a;
	}

	@Override
	public Recomponse edit(Recomponse a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Recomponse recompense = getById(b);
		session.delete(recompense);
		session.getTransaction().commit();
		
	}

	@Override
	public Recomponse getById(Long id) {
		return session.get(Recomponse.class, id);
	}

	@Override
	public List<Recomponse> getAll() {
		return session.createQuery("select o from Recomponse o").list();//SQL HQL
	}
	
	public static RecompenceDao getInsctance() {
		if (instance == null)
            instance = new RecompenceDao();
		return instance;
	}
}
