package metier.dao.util;

import java.util.List;

import metier.dao.beans.Langue;
import metier.dao.beans.User;
import metier.dao.beans.Role;

public class AddFirstData {

	public static void main(String[] args) {
		
		String[] langues    = {"Arabic" , "Frensh", "English", "Chinese", "Spanish" };
		List<Role> roles = Instances.roleDao.getAll();
		
    	if (roles.size() == 0) {
    		Instances.AjouterLesRoles("admin","desc");
    		Instances.AjouterLesRoles("docteur","desc");
    		Instances.AjouterLesRoles("clinique","desc");
    		Instances.AjouterLesRoles("utilisateur","desc");
		}
    	
    	List<Langue> languages = Instances.langueDao.getAll();
    	
    	if (languages.size() == 0) {
    		Instances.AjouterLangues(langues);
		}
    	
    	User user = Instances.signInService.VerifyUser("admin@gmail.com", "admin");
    	
    	if ( user == null ) {
    		Instances.AjouterAdmin();
		}

	}

}
