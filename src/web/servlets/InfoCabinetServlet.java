package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Docteur;
import metier.dao.util.Instances;


@WebServlet("/InfoCabinet")
public class InfoCabinetServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String djour = request.getParameter("jour_debut");
		String fjour = request.getParameter("jour_fin");
		String dheure = request.getParameter("heure_debut");
		String fheure = request.getParameter("heure_fin");
		String telemedecine = request.getParameter("telemedecine");
		String domicile = request.getParameter("Consultation_domicile");
		String rendezVous = request.getParameter("renderVousTelephone");
		String id = request.getParameter("id");
		
		Docteur docteur = Instances.docteurDao.getById(Long.valueOf(id));
		
		docteur.setHeureDepart(dheure);
		docteur.setHeureFin(fheure);
		docteur.setJourDepart(djour);
		docteur.setJourFin(fjour);
		
		
		if (telemedecine != null) {
			docteur.setTeleMedcine(true);
		}else {
			docteur.setTeleMedcine(false);
		}
		if (domicile != null) {
			docteur.setConsultationDomicile(true);
		} else {
			docteur.setConsultationDomicile(false);
		}
		if (rendezVous != null) {
			docteur.setRtelephonique(true);
		}else {
			docteur.setRtelephonique(false);
		}
		
		Instances.docteurDao.edit(docteur);
		
		HttpSession session = request.getSession(false);
		session.setAttribute("docteur", Instances.docteurDao.getById(docteur.getCin()));
		response.sendRedirect( request.getContextPath() + "/DataDoctor");
		//this.getServletContext().getRequestDispatcher("/DataDoctor").forward(request, response);
		
	}

}
