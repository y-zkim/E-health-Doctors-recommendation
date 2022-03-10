package metier.dao.Implementations;

import java.util.List;

import org.hibernate.Session;

import metier.dao.beans.Commentaire;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class CommentaireDao implements functionStd<Commentaire, Long> {

	Session session = HibernateUtil.openSession();
	private static CommentaireDao instance = null;
	
	private CommentaireDao() {

	}
	
	@Override
	public Commentaire add(Commentaire a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public Commentaire edit(Commentaire a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		Commentaire commentaire = getById(b);
		session.delete(commentaire);
		session.getTransaction().commit();
		
	}

	@Override
	public Commentaire getById(Long id) {
		return session.get(Commentaire.class, id);
	}

	@Override
	public List<Commentaire> getAll() {
		return session.createQuery("select o from Commentaire o").list();
	}
	
	public static CommentaireDao getInstance() {
	    if (instance == null)
               instance = new CommentaireDao();
	    return instance;
	}

}
