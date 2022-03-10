package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Hopital;
import metier.dao.util.Instances;


@WebServlet("/HospitalForm")
public class HospitalFormServlet extends HttpServlet {

	private static final String CHAMP_NAME = "name";
	private static final String CHAMP_ADRESSE = "adresse";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_TEL = "tel";
	private static final String CHAMP_ID = "id";
	private static final String CHAMP_VILLE = "ville";
	private static final String SUCESS = "/toAdminData";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name    = request.getParameter(CHAMP_NAME);
		String adresse   = request.getParameter(CHAMP_ADRESSE);
		String email = request.getParameter(CHAMP_EMAIL);
		String id      = request.getParameter(CHAMP_ID);
		String tel     = request.getParameter(CHAMP_TEL);
		String ville     = request.getParameter(CHAMP_VILLE);
		
		Hopital hopital = new Hopital();
		
		hopital.setAdresse(adresse);
		hopital.setId(id);
		hopital.setName(name);
		hopital.setTel(tel);
		hopital.setEmail(email);
		hopital.setVille(ville.toLowerCase());
		hopital.setDispo(true);
		
		HttpSession session = request.getSession(false);
		if (session.getAttribute("admin") != null) {
			Instances.hopitalDao.add(hopital);
		}
		
		response.sendRedirect( request.getContextPath() + SUCESS);
		//this.getServletContext().getRequestDispatcher(SUCESS).forward(request, response);
	}

}
