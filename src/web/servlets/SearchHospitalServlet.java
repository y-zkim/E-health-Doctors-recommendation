package web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.dao.beans.Hopital;
import metier.dao.util.Instances;
import metier.services.HopitalImpl;
import metier.services.RatingImpl;

@WebServlet("/searchHospital")
public class SearchHospitalServlet extends HttpServlet {

	private static final String VUE = "/WEB-INF/searchHospital.jsp";
	private static final String HOME = "/WEB-INF/Home.jsp";
	private static final String CHAMP_RECHERCHE = "adresse";
	
	List<Hopital> hospitals = new ArrayList<Hopital>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String adresse = request.getParameter(CHAMP_RECHERCHE);
		
		hospitals = Instances.hopitalImpl.getAllHospitalsAccordingToTheirAvailabilityAndAdress(adresse);
		
		if (hospitals != null) {
			request.setAttribute("hospitals", hospitals);
			request.setAttribute("impl", Instances.ratingImpl);
			request.setAttribute("adresse", adresse);
			this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
		}else {
			request.setAttribute("adresse", adresse);
			this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
