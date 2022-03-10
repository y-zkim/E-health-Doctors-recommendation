package metier.dao.Implementations;

import java.util.List;

import org.hibernate.Session;
import metier.dao.beans.Pharmacie;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class PharmacieDao implements functionStd<Pharmacie, Long> {

	Session session = HibernateUtil.openSession();
	private static PharmacieDao instance = null;
	
	private PharmacieDao() {
		
	}
	
	@Override
	public Pharmacie add(Pharmacie a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public Pharmacie edit(Pharmacie a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Pharmacie pharmacie = getById(b);
		session.delete(pharmacie);
		session.getTransaction().commit();
		
	}

	@Override
	public Pharmacie getById(Long id) {
		return session.get(Pharmacie.class, id);
	}

	@Override
	public List<Pharmacie> getAll() {
		return session.createQuery("select o from Pharmacie o").list();
	}
	
	public static PharmacieDao getInstance() {
	    if (instance == null)
               instance = new PharmacieDao();
	    return instance;
	}
}
