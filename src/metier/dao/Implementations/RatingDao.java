package metier.dao.Implementations;

import java.util.List;


import org.hibernate.Session;

import metier.dao.beans.Rating;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class RatingDao implements functionStd<Rating, Long> {

	Session session = HibernateUtil.openSession();
	private static RatingDao instance = null;
	
	private RatingDao() {
		
	}
	
	@Override
	public Rating add(Rating a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public Rating edit(Rating a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Rating rating = getById(b);
		session.delete(rating);
		session.getTransaction().commit();
		
	}

	@Override
	public Rating getById(Long id) {
		return session.get(Rating.class, id);
	}

	@Override
	public List<Rating> getAll() {
		return  session.createQuery("select o from Rating o").list();
	}
	
	public static RatingDao getInstance() {
	    if (instance == null)
               instance = new RatingDao();
	    return instance;
	}

}
