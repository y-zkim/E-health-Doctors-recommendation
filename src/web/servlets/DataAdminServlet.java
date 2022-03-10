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

import metier.dao.beans.Commentaire;
import metier.dao.beans.Pharmacie;
import metier.dao.beans.User;
import metier.dao.util.Instances;

@WebServlet("/toAdminData")
public class DataAdminServlet extends HttpServlet {
	
	private static final String VUE_ADMIN = "/WEB-INF/AdminDashboard.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	List<Pharmacie> list = new ArrayList<Pharmacie>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		List<Commentaire> comments = Instances.commentImpl.getCommentsNotApproved(false, false);
		request.setAttribute("comments", comments);
		function();
		request.setAttribute("pharmacieDao", Instances.pharmacieDao);
		request.setAttribute("allPharmacies", list );
		request.setAttribute("allHospitals", Instances.hopitalImpl.getAllHopitalesAccordingToTheirAvailability(true));
		request.setAttribute("allCliniques", Instances.cliniqueImpl.getAllClinicsAccordingToTheirAvailability(true));
		request.setAttribute("allDoctors", Instances.docteurImpl.getDoctorsAccordingToTheirAvailability(true));
		request.setAttribute("clinics", Instances.cliniqueImpl.getAllClinicsAccordingToTheirAdminConfirmation( false ));
		request.setAttribute("docs", Instances.docteurImpl.getAllDoctorsAccordingToTheirAdminConfirmation(false));
		request.setAttribute("nbrUsers", Instances.userImpl.getNumbersOfUserVisiter(4) != null ? Instances.userImpl.getNumbersOfUserVisiter(4) : 0 );
		request.setAttribute("nbrDoctors", Instances.userImpl.getNumbersOfUser("Docteur") != null ? Instances.userImpl.getNumbersOfUser("Docteur") : 0  );
		request.setAttribute("nbrPharmacies", Instances.userImpl.getNumbersOfUser("Pharmacie") != null ? Instances.userImpl.getNumbersOfUser("Pharmacie") : 0 );
		request.setAttribute("nbrClinics", Instances.userImpl.getNumbersOfUser("Clinique") != null ? Instances.userImpl.getNumbersOfUser("Clinique") : 0  );
		
		if (session != null) {
			this.getServletContext().getRequestDispatcher(VUE_ADMIN).forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/Home.jsp");
		}
	}
	
	public void function() {
		list = Instances.pharmacieImpl.getAllPharmaciesAccordingToTheirAvailability(true);
	}

}
