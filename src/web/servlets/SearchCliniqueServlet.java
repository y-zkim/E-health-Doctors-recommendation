package web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.dao.beans.Clinique;
import metier.dao.util.Instances;
import metier.services.CliniqueImpl;
import metier.services.RatingImpl;

@WebServlet("/searchClinique")
public class SearchCliniqueServlet extends HttpServlet {

	private static final String VUE             = "/WEB-INF/searchClinique.jsp";
	private static final String HOME            = "/WEB-INF/Home.jsp";
	private static final String CHAMP_RECHERCHE = "adresse";
	List<Clinique> cliniques                    = new ArrayList<Clinique>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adresse = request.getParameter(CHAMP_RECHERCHE);
		
		cliniques                               = Instances.cliniqueImpl.getAllClinicsAccordingToTheirAvailabilityAndAdress(adresse, true);
		
		
		
		if (cliniques != null) {
			request.setAttribute("cliniques", cliniques);
			request.setAttribute("impl", Instances.ratingImpl);
			request.setAttribute("adresse", adresse);
			this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
		}else {
			request.setAttribute("cliniques", cliniques);
			request.setAttribute("impl", Instances.ratingImpl);
			request.setAttribute("adresse", adresse);
			this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
