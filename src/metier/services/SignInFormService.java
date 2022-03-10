package metier.services;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;

import metier.dao.beans.User;
import metier.dao.util.HibernateUtil;

public class SignInFormService {
	
	Session session = HibernateUtil.openSession();
	private static SignInFormService instance = null;

	    private static final String CHAMP_EMAIL        = "email";
	    private static final String CHAMP_PASSWORD     = "password";

	    private String              resultat;
	    private Map<String, String> erreurs            = new HashMap<String, String>();

	    public String getResultat() {
	        return resultat;
	    }

	    public void setResultat( String resultat ) {
	        this.resultat = resultat;
	    }

	    public Map<String, String> getErreurs() {
	        return erreurs;
	    }
	    
	    
	    public void setErreurs(Map<String, String> erreurs) {
			this.erreurs = erreurs;
		}

		public User VerifyUser( String email,String password) {
	    	String hql="select u from User u where email = :email and password = :password";
	        Query query = session.createQuery( hql );
	        query.setParameter("email", email);
	        query.setParameter("password", password);
	        List<User> list = query.getResultList();
	        if (list.size() == 0) {
	        	System.out.println("---------> "+list.size());
				return null;
				
			}else {
				System.out.println("from verify user " + list.get(0).getEmail() + "  "+list.get(0).getPassword());
				System.out.println("---------> "+list.size());
				return list.get(0);
			}
    		    		
    	}
		
	    
	    public User SignInService(HttpServletRequest request) {
	        
	        String email = request.getParameter( CHAMP_EMAIL );
	        String password = request.getParameter( CHAMP_PASSWORD );
	        User visiter = new User();        
	        User listUser=VerifyUser(email, password);

	        if(listUser!=null) {
	        	erreurs.clear();
	        	resultat = "Succes d'inscription!";
	        }
	        else {
	        	visiter.setEmail(email);
	        	erreurs.put( CHAMP_EMAIL, "Vous etes pas inscrit" );
	        	resultat = "echec d'inscription";
	        }


	        return listUser;
	    }
	   
	    public static SignInFormService getInstance() {
	        if ( instance == null )
	            instance = new SignInFormService();
	        return instance;
	    }
}
