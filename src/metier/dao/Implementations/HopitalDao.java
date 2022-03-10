package metier.dao.Implementations;

import java.util.List;

import org.hibernate.Session;
import metier.dao.beans.Hopital;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class HopitalDao implements functionStd<Hopital, Long>{

	Session session = HibernateUtil.openSession();
	private static HopitalDao instance = null;
	
	private HopitalDao() {
		
	}
	@Override
	public Hopital add(Hopital a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public Hopital edit(Hopital a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Hopital hopital = getById(b);
		session.delete(hopital);
		session.getTransaction().commit();
		
	}

	@Override
	public Hopital getById(Long id) {
		return session.get(Hopital.class, id);
	}

	@Override
	public List<Hopital> getAll() {
		return session.createQuery("select o from Hopital o").list();
	}
	
	public static HopitalDao getInstance() {
	    if (instance == null)
               instance = new HopitalDao();
	    return instance;
	}

}
