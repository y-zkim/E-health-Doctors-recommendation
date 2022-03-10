package metier.services;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

import metier.dao.beans.Commentaire;
import metier.dao.beans.Docteur;
import metier.dao.util.HibernateUtil;

public class CommentaireImpl {
	
	Session session = HibernateUtil.openSession();
	private static CommentaireImpl instance = null;
	
	private CommentaireImpl() {
		
	}
	
	public List<Commentaire> getCommentsNotApproved(Boolean approve , Boolean deleted){
		String hql = "select c from Commentaire c where approv = :app and del = :del";
		Query q = session.createQuery(hql);
		q.setParameter("app", approve);
		q.setParameter("del", deleted);
		List<Commentaire> list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public List<Commentaire> getComments(Long id, String par){
		String hql = "select c from Commentaire c where "+ par +" = :id";
		Query q = session.createQuery(hql);
		q.setParameter("id", id);
		List<Commentaire> list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public List<Commentaire> getCommentsClinique(Long id, String par, Boolean bool){
		String hql = "select c from Commentaire c where "+ par +" = :id and del = :bool";
		Query q = session.createQuery(hql);
		q.setParameter("id", id);
		q.setParameter("bool", bool);
		List<Commentaire> list = q.getResultList();
		if (list.size() != 0) {
			return list;
		}else {
			return null;
		}
	}
	
	public Long getNumbersOfComments(Long id, String par){
		String hql = "select count(c) from Commentaire c where "+ par +" = :id";
		Query q = session.createQuery(hql);
		q.setParameter("id", id);
		List<Long> list = q.getResultList();
		if (list.size() != 0) {
			return list.get(0);
		}else {
			return null;
		}
	}
	
	public static CommentaireImpl getInstance() {
	    if (instance == null)
	                   instance = new CommentaireImpl();
	    return instance;
	}
}
