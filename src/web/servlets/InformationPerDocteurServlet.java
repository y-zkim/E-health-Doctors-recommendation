package web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Docteur;
import metier.dao.beans.Langue;
import metier.dao.util.Instances;

@WebServlet("/InformationPerso")
public class InformationPerDocteurServlet extends HttpServlet {
	
	private static final String CHAMP_SEXE = "sexe";
	private static final String CHAMP_TEL = "Telephone";
	private static final String CHAMP_ADRESSE = "Adresse";
	private static final String CHAMP_VILLE = "Ville";
	private static final String CHAMP_DATE_NAISS = "";
	private static final String CHAMP_DESC = "description";
	private static final String CHAMP_BIO = "biographie";
	private static final String CHAMP_SPECIALITY = "speciality";
	private static final String CHAMP_NOM = "Nom";
	private static final String CHAMP_PRENOM = "Prenom";
	private static final String CHAMP_LANGUE = "langue";
	private static final String CHAMP_ID = "id";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter(CHAMP_NOM);
		String prenom = request.getParameter(CHAMP_PRENOM);
		String adresse = request.getParameter(CHAMP_ADRESSE);
		String speciality = request.getParameter(CHAMP_SPECIALITY);
		String[] langue = request.getParameterValues(CHAMP_LANGUE);
		String bio = request.getParameter(CHAMP_BIO);
		String desc = request.getParameter(CHAMP_DESC);
		String ville = request.getParameter(CHAMP_VILLE);
		String date = request.getParameter(CHAMP_DATE_NAISS);
		String tel = request.getParameter(CHAMP_TEL);
		String sexe = request.getParameter(CHAMP_SEXE);
		String id = request.getParameter(CHAMP_ID);
		List<Langue> languages = new ArrayList<Langue>();
		System.out.println(" -- speciality -- : "+speciality);
		if (langue != null) {
			for (int i = 0; i < langue.length; i++) {
				System.out.println(langue[i]);
			    Langue l = Instances.langueImpl.getLangueByString(langue[i]);
			    languages.add(l);
			}
		}
		
		Docteur docteur = Instances.docteurDao.getById(Long.valueOf(id));
		
		docteur.setAdresse(adresse);
		docteur.setGender(sexe);
		docteur.setBiographie(bio);
		docteur.setDescription(desc);
		docteur.setVille(ville);
		docteur.setTel(tel);
		docteur.setSpeciality(speciality);
		docteur.setFirstname(prenom);
		docteur.setLastname(nom);
		docteur.setLangues(languages);
	
		if (!docteur.getFirst_using()) {
			
			docteur.setFirst_using(true);
			docteur.setDispo(true);
			Instances.docteurDao.edit(docteur);
		}else {
			Instances.docteurDao.edit(docteur);
		}
		
		Docteur d = Instances.docteurDao.getById(docteur.getCin());
		
		HttpSession session = request.getSession(false);
		session.setAttribute("docteur", d);
		response.sendRedirect( request.getContextPath() + "/DataDoctor");
		//this.getServletContext().getRequestDispatcher("/DataDoctor").forward(request, response);
	}

}
