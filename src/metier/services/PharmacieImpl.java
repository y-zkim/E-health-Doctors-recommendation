package metier.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Pharmacie;
import metier.dao.util.HibernateUtil;

public class PharmacieImpl  {

	private static PharmacieImpl instance = null;
	private Session session = HibernateUtil.openSession();
	
	private PharmacieImpl() {
		
	}
	
	public List<Pharmacie> getPharmaciesByYourAdress(String ville, Boolean bool){
		List<Pharmacie> list = new ArrayList<Pharmacie>();
		String hql = "select p from Pharmacie p where ville like ?1";
		Query q = session.createQuery(hql);
		String[] currencies = ville.split(",");
		currencies = currencies[0].split(" ");
		currencies = currencies[0].split(";");
		q.setParameter(1, "%"+ currencies[0].toLowerCase() + "%");
		list = q.getResultList();
		return list;
	}
	
	
	public List<Pharmacie> getAllPharmaciesAccordingToTheirAvailability(Boolean bool){
		List<Pharmacie> list = new ArrayList<Pharmacie>();
		String hql = "select c from Pharmacie c where dispo = :bool";
		Query q = session.createQuery(hql);
		q.setParameter("bool", bool);
		list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	public static PharmacieImpl getInstance() {
	    if (instance == null)
	                   instance = new PharmacieImpl();
	    return instance;
	}
}
