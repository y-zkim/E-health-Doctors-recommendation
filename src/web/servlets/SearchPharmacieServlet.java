package web.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.dao.beans.Pharmacie;
import metier.services.PharmacieImpl;

@WebServlet("/SearchPharmacie")
public class SearchPharmacieServlet extends HttpServlet {
    
	private static final String VUE = "/WEB-INF/searchPharmacie.jsp";
	private static final String CHAMP_VILLE = "ville";
	PharmacieImpl pharmacieImpl = PharmacieImpl.getInstance();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adresse = request.getParameter( CHAMP_VILLE );
		
		List<Pharmacie> pharmacies = pharmacieImpl.getPharmaciesByYourAdress( adresse , true);
		
		if (pharmacies != null) {
			request.setAttribute("pharmacies", pharmacies);
			request.setAttribute("adresse", adresse);
			this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
		}
	}

}
