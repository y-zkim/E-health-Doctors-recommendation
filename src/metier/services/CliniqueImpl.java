package metier.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Clinique;
import metier.dao.beans.Docteur;
import metier.dao.util.HibernateUtil;

public class CliniqueImpl {

	private static CliniqueImpl instance = null;
	private Session session = HibernateUtil.openSession();
	private CliniqueImpl() {
		
	}
	
	public List<Clinique> getAllClinicsAccordingToTheirAvailabilityAndAdress(String ville , Boolean bool){
		List<Clinique> list = new ArrayList<Clinique>();
		String hql = "select c from Clinique c where dispo = :bool and  ville like ?1";
		Query q = session.createQuery(hql);
		q.setParameter("bool", bool);
		String[] currencies = ville.split(",");
		currencies = currencies[0].split(" ");
		currencies = currencies[0].split(";");
		q.setParameter(1, "%"+ currencies[0].toLowerCase() + "%");
		list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
		
	}
	
	public Long getNumberOfVisiters(Clinique clinique) {
		String hql = "select o.nbrVisiters from Clinique o  where cin = :idClinique";
		Query q = session.createQuery(hql);
		q.setParameter("idClinique", clinique.getCin());
		List<Long> nbr = q.getResultList();
		if (nbr.size() != 0) {
			return nbr.get(0);
		}else {
			return Long.valueOf(0);
		}
	}
	
	public List<Clinique> getAllClinicsAccordingToTheirAvailability(Boolean bool){
		List<Clinique> list = new ArrayList<Clinique>();
		String hql = "select c from Clinique c where dispo = :bool";
		Query q = session.createQuery(hql);
		q.setParameter("bool", bool);
		list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public List<Clinique> getAllClinicsAccordingToTheirAdminConfirmation(Boolean bool){
		List<Clinique> list = new ArrayList<Clinique>();
		String hql = "select c from Clinique c where admin_confirmation = :bool";
		Query q = session.createQuery(hql);
		q.setParameter("bool", bool);
		list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public static CliniqueImpl getInstance() {
	    if (instance == null)
	                   instance = new CliniqueImpl();
	    return instance;
	}
}
