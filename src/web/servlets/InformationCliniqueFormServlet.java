package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Clinique;
import metier.dao.util.Instances;

@WebServlet("/InformationClinique")
public class InformationCliniqueFormServlet extends HttpServlet {
	
	private static final String CHAMP_NAME = "nom";
	private static final String CHAMP_ADRESSE = "adresse";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_TEL = "tel";
	private static final String CHAMP_DESC = "desc";
	private static final String CHAMP_TEL_URGENCE = "urgence";
	private static final String CHAMP_SPECIALITY = "speciality";
	private static final String CHAMP_ID = "id";
	private static final String CHAMP_ID_LOCALISATION = "id_localisation";
	private static final String CHAMP_VILLE = "ville";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if ( session.getAttribute("clinique") != null ) {
			String name = request.getParameter(CHAMP_NAME);
			String adresse = request.getParameter(CHAMP_ADRESSE);
			String tel = request.getParameter(CHAMP_TEL);
			String tel_urgence = request.getParameter(CHAMP_TEL_URGENCE);
			String speciality = request.getParameter(CHAMP_SPECIALITY);
			String description = request.getParameter(CHAMP_DESC);
			String email = request.getParameter(CHAMP_EMAIL);
			String id = request.getParameter(CHAMP_ID);
			String id_localisation = request.getParameter(CHAMP_ID_LOCALISATION);
			String ville = request.getParameter( CHAMP_VILLE );
			
			Clinique clinique = Instances.cliniqueDao.getById(Long.valueOf(id));

			clinique.setAdresse(adresse);
			clinique.setName(name);
			clinique.setAdresse(adresse);
			clinique.setSpeciality(speciality);
			clinique.setDescription(description);
			clinique.setTel(tel);
			clinique.setEmergency_tel(tel_urgence);
			clinique.setId(id_localisation);
			clinique.setVille(ville);
			clinique.setEmail(email); // confirmation email
			Clinique  c = new Clinique();
			if (clinique.getFirst_using()) {
				c = Instances.cliniqueDao.edit(clinique);
			}else {
				clinique.setFirst_using(true);
				clinique.setDispo(true);
				c = Instances.cliniqueDao.edit(clinique);
			}
			
			session.setAttribute("clinique", c);
			response.sendRedirect( request.getContextPath() + "/DataClinique");
			
		} else {
			response.sendRedirect( request.getContextPath() + "/Home");
		}
	}
	

}

