package metier.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Docteur;
import metier.dao.beans.Hopital;
import metier.dao.beans.Pharmacie;
import metier.dao.util.HibernateUtil;

public class HopitalImpl {

	private static HopitalImpl instance = null;
	private Session session = HibernateUtil.openSession();
	
	private HopitalImpl() {
		
	}
	
	public List<Hopital> getAllHospitalsAccordingToTheirAvailabilityAndAdress(String ville){
		List<Hopital> list = new ArrayList<Hopital>();
		String hql = "select h from Hopital h where ville like ?1";
		Query q = session.createQuery(hql);
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
	
	public List<Hopital> getAllHopitalesAccordingToTheirAvailability(Boolean bool){
		List<Hopital> list = new ArrayList<Hopital>();
		String hql = "select c from Hopital c where dispo = :bool";
		Query q = session.createQuery(hql);
		q.setParameter("bool", bool);
		list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public static HopitalImpl getInstance() {
	    if (instance == null)
	                   instance = new HopitalImpl();
	    return instance;
	}
}
