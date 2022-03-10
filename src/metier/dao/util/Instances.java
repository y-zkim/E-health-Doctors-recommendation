package metier.dao.util;

import java.util.ArrayList;
import java.util.List;

import metier.dao.Implementations.CliniqueDao;

import metier.dao.Implementations.CommentaireDao;
import metier.dao.Implementations.DocteurDao;
import metier.dao.Implementations.EducationDao;
import metier.dao.Implementations.HopitalDao;
import metier.dao.Implementations.LangueDao;
import metier.dao.Implementations.PharmacieDao;
import metier.dao.Implementations.RatingDao;
import metier.dao.Implementations.RecompenceDao;
import metier.dao.Implementations.RoleDao;
import metier.dao.Implementations.UserDao;
import metier.dao.beans.Docteur;
import metier.dao.beans.Langue;
import metier.dao.beans.Role;
import metier.dao.beans.User;
import metier.services.CliniqueImpl;
import metier.services.CommentaireImpl;
import metier.services.DocteurImpl;
import metier.services.EducationImpl;
import metier.services.HopitalImpl;
import metier.services.LangueImpl;
import metier.services.PharmacieImpl;
import metier.services.RatingImpl;
import metier.services.RecompenseImpl;
import metier.services.RoleImpl;
import metier.services.SendEmailService;
import metier.services.SignInFormService;
import metier.services.UserImpl;

public class Instances {
	
	public static DocteurDao docteurDao       = DocteurDao.getInstance();
	public static DocteurImpl docteurImpl     = DocteurImpl.getInstance();
	public static RatingDao ratingDao         = RatingDao.getInstance();
	public static RatingImpl ratingImpl       = RatingImpl.getInstance();
	public static CommentaireDao commentDao   = CommentaireDao.getInstance();
	public static CommentaireImpl commentImpl = CommentaireImpl.getInstance();
	public static UserDao userDao             = UserDao.getInstance();
	public static UserImpl userImpl           = UserImpl.getInstance();
	public static RoleImpl roleImpl           = RoleImpl.getInstance();
    public static RoleDao roleDao             = RoleDao.getInstance();
    public static CliniqueDao cliniqueDao     = CliniqueDao.getInsctance();
    public static CliniqueImpl cliniqueImpl   = CliniqueImpl.getInstance();
    public static HopitalDao hopitalDao       = HopitalDao.getInstance();
    public static HopitalImpl hopitalImpl     = HopitalImpl.getInstance();
    public static EducationImpl educImpl      = EducationImpl.getInstance();
    public static EducationDao educDao      = EducationDao.getInsctance();
	public static RecompenseImpl recomImpl    = RecompenseImpl.getInstance();
	public static RecompenceDao recomDao    = RecompenceDao.getInsctance();
	public static LangueDao langueDao         = LangueDao.getInsctance();
	public static LangueImpl langueImpl       = LangueImpl.getInstance();
	public static PharmacieDao pharmacieDao = PharmacieDao.getInstance();
	public static SignInFormService signInService = SignInFormService.getInstance();
	public static SendEmailService send   = SendEmailService.getInstance();
	public static PharmacieImpl pharmacieImpl = PharmacieImpl.getInstance();
	
	public static List<String> languages = new ArrayList<String>();
	public static List<String> jours = new ArrayList<String>();
	public static List<String> heurs = new ArrayList<String>();

	public static List<String> specialities(){
		languages.add("Chirurgie esthétique");
		languages.add("Chirurgie vasculaire");
		languages.add("Chirurgie viscérale et digestive");
		languages.add("Gynécologie obstétrique");
		languages.add("Neurochirurgie");
		languages.add("Allergologie");
		languages.add("Anatomie et cytologie pathologique");
		languages.add("Anesthésie");
		languages.add("Cardiologie");
		languages.add("Dermatologie");
		languages.add("Endocrinologie-nutrition");
		languages.add("Génétique");
		languages.add("Allergologie");
		languages.add("Gynécologie médicale");
		languages.add("Hématologie");
		languages.add("Urgentiste");
		languages.add("Santé publique");
		languages.add("Réanimation");
		languages.add("Radiologie");
		languages.add("Psychiatrie");
		languages.add("Neurologie");
		languages.add("Néphrologie");
		languages.add("Médecine physique et réadaptation");
		languages.add("Médecine générale");
		languages.add("Chirurgie pédiatrique");
		languages.add("Chirurgie visc�rale et digestive");
		languages.add("Gyn�cologie obst�trique");
		languages.add("Neurochirurgie");
		languages.add("Allergologie");
		languages.add("Anatomie et cytologie pathologique");
		languages.add("Anesth�sie");
		languages.add("Cardiologie");
		languages.add("Dermatologie");
		languages.add("Endocrinologie-nutrition");
		languages.add("G�n�tique");
		languages.add("Allergologie");
		languages.add("Gyn�cologie m�dicale");
		languages.add("H�matologie");
		languages.add("Urgentiste");
		languages.add("Sant� publique");
		languages.add("R�animation");
		languages.add("Radiologie");
		languages.add("Psychiatrie");
		languages.add("Neurologie");
		languages.add("N�phrologie");
		languages.add("M�decine physique et r�adaptation");
		languages.add("M�decine g�n�rale");
		languages.add("Chirurgie p�diatrique");
		return languages;
	}
	
	public List<String> days(){
		jours.add("Lundi");
		jours.add("Mardi");
		jours.add("Mercredi");
		jours.add("Jeudi");
		jours.add("Vendredi");
		jours.add("Samedi");
		jours.add("Dimanche");
		return jours;
	}
	
	public List<String> Heurs(){
		for (int i = 1; i < 10; i++) {
			heurs.add("0" + i + ":00");
		}
		for (int i = 10; i < 25; i++) {
			heurs.add( i + ":00");
		}
		return heurs;
	}
	
	public static String convertNumberPhone(String telephone) {
		if (telephone != null) {
			String[] str = telephone.split("");
			String string ="";
			for(int i = 1 ; i<str.length ; i++) {
				string += str[i];
			}
			return string;
		} else {
			return null;
		}
	}
	
	public static void AjouterLesRoles(String role , String description) {
		Role r = new Role();
		r.setDescription(description);
		r.setRole(role);
		Instances.roleDao.add(r);
	}
	
	public static void AjouterLangues(String[] langues) {
		for (int i = 0; i < langues.length; i++) {
			Langue langue = new Langue();
			langue.setLangue(langues[i]);
			Instances.langueDao.add(langue);
		}
	}
	
	public static void AjouterAdmin() {
		User user = new User();
		Role role = Instances.roleDao.getById(1);
		user.setEmail("admin@gmail.com");
		user.setFirstname("youssef");
		user.setLastname("el gourari");
		user.setPassword("admin");
		user.setRole(role);
		Instances.userDao.add(user);
	}

}
