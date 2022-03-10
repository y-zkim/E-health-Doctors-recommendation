package metier.dao.Implementations;

import java.util.List;

import org.hibernate.Session;

import metier.dao.beans.Role;
import metier.dao.util.HibernateUtil;
import metier.dao.util.functionStd;

public class RoleDao implements functionStd<Role, Integer> {

	Session session = HibernateUtil.openSession();
	private static RoleDao instance = null;
	
	private RoleDao() {
		
	}
	
	@Override
	public Role add(Role a) {
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public Role edit(Role a) {
		session.beginTransaction();
		session.merge(a);
		session.getTransaction().commit();
		return a;
	}

	@Override
	public void delete(Integer b) {
		session.beginTransaction();
		Role role = getById(b);
		session.delete(role);
		session.getTransaction().commit();
		
	}

	@Override
	public Role getById(Integer id) {
		return session.get(Role.class, id);
	}

	@Override
	public List<Role> getAll() {
		return session.createQuery("select o from Role o").list();
	}
	
	public static RoleDao getInstance() {
	    if (instance == null)
               instance = new RoleDao();
	    return instance;
	}

}
