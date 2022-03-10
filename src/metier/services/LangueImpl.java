package metier.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Langue;
import metier.dao.util.HibernateUtil;

public class LangueImpl {
	
	Session session = HibernateUtil.openSession();
	
	private static LangueImpl instance = null;
	
	private LangueImpl() {
		
	}
	
	public static LangueImpl getInstance() {
	    if (instance == null)
	                   instance = new LangueImpl();
	    return instance;
	}

	// recuperer l'objet Langue par leur nom
	public Langue getLangueByString(String name) {
    	Query query = session.createQuery("select o from Langue o where langue = :name");
    	query.setParameter("name", name);
    	List<Langue> langue = query.getResultList();
    	if (langue.size() != 0) {
		System.out.println("---------> "+langue.size());
    		return langue.get(0);
		}else {
			return null;
		}
    	
    }
}
