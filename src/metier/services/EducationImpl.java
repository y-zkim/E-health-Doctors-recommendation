package metier.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Docteur;
import metier.dao.beans.Education;
import metier.dao.util.HibernateUtil;

public class EducationImpl {

private static EducationImpl instance = null;
Session session = HibernateUtil.openSession();
	
	private EducationImpl() {
		
	}
	
	public List<Education> getEducationByDoctor(Docteur docteur){
		String hql = "select e from Education e where idDocteur = :idDocteur";
		Query q = session.createQuery(hql);
		q.setParameter("idDocteur", docteur.getCin());
		List<Education> list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public static EducationImpl getInstance() {
	    if (instance == null)
	                   instance = new EducationImpl();
	    return instance;
	}
}
