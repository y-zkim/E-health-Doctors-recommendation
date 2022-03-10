package metier.services;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Clinique;
import metier.dao.beans.Commentaire;
import metier.dao.beans.Docteur;
import metier.dao.beans.Hopital;
import metier.dao.beans.Rating;
import metier.dao.beans.User;
import metier.dao.util.HibernateUtil;

public class RatingImpl {

	private static RatingImpl instance = null;
	Session session = HibernateUtil.openSession();
	
	private RatingImpl() {
		
	}
	
	public static RatingImpl getInstance() {
	    if (instance == null)
	                   instance = new RatingImpl();
	    return instance;
	}
	
	public Map<Integer, String> getPercentageOfEtoiles(Long idDeQui , String par) {
		Map<Integer, String> percentages = new HashMap<Integer, String>();
		Map<Integer, Long> distinct = countDistinctValueOfRate(idDeQui, par);
		
		Long nbr = getNumberOfRating(idDeQui, par);
		Double aide_one = null;
		if (nbr != null) {
			 aide_one = Double.valueOf(nbr);
		} else {
			aide_one = 0.0;
		}
		
		for(int i=1; i<6; i++) {
			Double aide_two = Double.valueOf(distinct.getOrDefault(i, Long.valueOf(0)));
			if (aide_one != 0.0) {
				Double variable = (double) ((aide_two/aide_one)*100);
				percentages.put(i, new DecimalFormat("##.##").format(variable));
			} else {
				percentages.put(i, new DecimalFormat("##.##").format(0));
			}
		}
		
		return percentages;
	}
	
	public Map<Integer , Long> countDistinctValueOfRate(Long id , String par){
		Map<Integer , Long > map = new HashMap<Integer , Long>();
		Long aide;
		for(int i=1 ; i<6 ; i++) {
			map.put(i, countRatingEtoiles(i, id, par));
		}
		return map;
	}
	
	public Long countRatingEtoiles(int number, Long id, String par) {
		String hql = "select count(r.numberEtoile) from Rating r where " + par +" = :id and numberEtoile = :nbr";
		Query q = session.createQuery(hql);
		q.setParameter("id", id);
		q.setParameter("nbr", number);
		List<Long> list = q.getResultList();
		if (list.size() !=0) {
			return  list.get(0);
		}else {
			return Long.valueOf(0);
		}
		
	}
	
	public Long getNumberOfEtoile(Long id , String par) {
		String hql = "select sum(o.numberEtoile) from Rating o where " + par +" = :id";
		Query q = session.createQuery(hql);
		q.setParameter("id", id);
		List<Long> list = q.getResultList();
		if(list.size() != 0) {
			return list.get(0);
		}else {
			return null;
		}
	}
	
	public Long getNumberOfRating( Long a , String par ) {
		String hql = "select count(o.idRating) from Rating o where "+ par + " = :id";
		Query q = session.createQuery(hql);
		q.setParameter("id", a);
		List<Long> list = q.getResultList();
		if(list.size() != 0 ) {
			return list.get(0);
		} else {
			return null;
		}
	}
	
	public int getAverageOfRating(Long a , String s) {
		Long numberofEtoile = getNumberOfEtoile(a,s);
		Long numberOfRating = getNumberOfRating(a,s);
		if (numberofEtoile != null && numberOfRating != null) {
			Double nbr = Double.valueOf(numberofEtoile);
			Double b = Double.valueOf(numberOfRating);
			int c = (int) Math.round(nbr/b);
			return c;
		} else {
			return 0;
		}
		
	}
	
	public Double average(Long docteur, String par) {
		Long numberofEtoile = getNumberOfEtoile(docteur, par);
		Long numberOfRating = getNumberOfRating(docteur, par);
		if ( numberofEtoile != null && numberOfRating != null  ) {
			Double a = numberofEtoile + 0.0;
			Double b = numberOfRating + 0.0;
			if (b != 0) {
				return a/b;
			}else {
				return 0.0;
			}
		} else {
			return 0.0;
		}
	}
	
	public int getNumberOfEtoileByUserAndDocteur(User user , Docteur docteur) {
		String hql = "select c.numberEtoile from Rating c where idUser = :idUser and idDocteur = :idDocteur";
		Query q = session.createQuery(hql);
		q.setParameter("idUser", user.getCin());
		q.setParameter("idDocteur", docteur.getCin());
		List<Integer> list = q.getResultList();
		if (list.size() != 0) {
			return list.get(0);
		}else {
			return 0;
		}
	}
	
	public int getNumberOfEtoileByUserAndHopital(User user , Hopital hopital) {
		String hql = "select c.numberEtoile from Rating c where idUser = :idUser and idHopital = :idHopital";
		Query q = session.createQuery(hql);
		q.setParameter("idUser", user.getCin());
		q.setParameter("idHopital", hopital.getIdHopital());
		List<Integer> list = q.getResultList();
		if (list.size() != 0) {
			return list.get(0);
		}else {
			return 0;
		}
	}
	
	public int getNumberOfEtoileByUserAndClinique(User user , Clinique clinique) {
		String hql = "select c.numberEtoile from Rating c where idUser = :idUser and idClinique = :idClinique";
		Query q = session.createQuery(hql);
		q.setParameter("idUser", user.getCin());
		q.setParameter("idClinique", clinique.getCin());
		List<Integer> list = q.getResultList();
		if (list.size() != 0) {
			return list.get(0);
		}else {
			return 0;
		}
	}
	
	public Rating getRatingByClass(Long id ,Long id_, String par) {
		String hql = "select r from Rating r where idUser = :idUser and " + par +" = :id";
		Query q = session.createQuery(hql);
		q.setParameter("idUser", id);
		q.setParameter("id", id_);
		List<Rating> list = q.getResultList();
		if (list.size() != 0) {
			return list.get(0);
		}else {
			return null;
		}
	}
}
