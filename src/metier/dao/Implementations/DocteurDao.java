package metier.dao.Implementations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Docteur;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class DocteurDao implements functionStd<Docteur, Long> {

	Session session = HibernateUtil.openSession();
	private static DocteurDao instance = null;
	
	private DocteurDao() {
		
	}
	
	@Override
	public Docteur add(Docteur a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public Docteur edit(Docteur a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Docteur docteur = getById(b);
		session.delete(docteur);
		session.getTransaction().commit();
		
	}

	@Override
	public Docteur getById(Long id) {
		return session.get(Docteur.class, id);
	}

	@Override
	public List<Docteur> getAll() {
		return session.createQuery("select o from Docteur o").list();
	}
	
	public List<Docteur> getFromDocteurs(long cin){
		Query q = session.createQuery("select o from Docteur o where cin = :d");
		q.setParameter("d", cin);
		List<Docteur> list = q.getResultList();
		return list;
	}
	
	public static DocteurDao getInstance() {
	    if (instance == null)
	                   instance = new DocteurDao();
	    return instance;
	}
}
