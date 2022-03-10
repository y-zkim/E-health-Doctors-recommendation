package metier.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Docteur;
import metier.dao.beans.Recomponse;
import metier.dao.util.HibernateUtil;

public class RecompenseImpl {

	private static RecompenseImpl instance = null;
	Session session = HibernateUtil.openSession();
	
	private RecompenseImpl() {
		
	}
	
	public List<Recomponse> getRecompenseByDoctor(Docteur docteur){
		String hql = "select r from Recomponse r where idDocteur = :idDocteur";
		Query q = session.createQuery(hql);
		q.setParameter("idDocteur", docteur.getCin());
		List<Recomponse> list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public static RecompenseImpl getInstance() {
	    if (instance == null)
	                   instance = new RecompenseImpl();
	    return instance;
	}
}
