package metier.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Role;
import metier.dao.util.HibernateUtil;

public class RoleImpl {
	
	private static RoleImpl instance = null;
	Session session= HibernateUtil.openSession();	
	private RoleImpl() {
		
	}
	
	public Role  getRolebyrole(String role) {
		String hql="select o From Role o where o.role=:role";
		Query query=session.createQuery(hql);
		query.setParameter("role", role);
		List<Role> listR=query.getResultList();
		if(listR.size()==0) {
			return null;
		}else {
			return listR.get(0);
		}
	
	}
	
	public static RoleImpl getInstance() {
	    if (instance == null)
	                   instance = new RoleImpl();
	    return instance;
	}
}
