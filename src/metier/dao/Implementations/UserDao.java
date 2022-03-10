package metier.dao.Implementations;



import java.util.List;
import org.hibernate.Session;
import metier.dao.beans.User;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class UserDao implements functionStd<User, Long>{
	
	// je vois que nous avons pas besoin de ce class, on utilise seulement l'implémentations de fils !! 
	// possible de le supprimer apres !!
	
	Session session = HibernateUtil.openSession();
	private static UserDao instance = null;
	
	private UserDao() {
		
	}

	@Override
	public User add(User a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public User edit(User a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Long b) {
		session.beginTransaction();
		User user = getById(b);
		session.delete(user);
		session.getTransaction().commit();
	}

	@Override
	public List<User> getAll() {
		return  session.createQuery("select o from User o").list();
	}
	
	@Override
	public User getById(Long id) {
		return session.get(User.class, id);
	}
	
	public static UserDao getInstance() {
	    if (instance == null)
               instance = new UserDao();
	    return instance;
	}

}
