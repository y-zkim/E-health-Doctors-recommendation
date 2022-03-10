package web.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Clinique;
import metier.dao.beans.Commentaire;
import metier.dao.beans.Docteur;
import metier.dao.util.Instances;

@WebServlet("/DataClinique")
public class DataCliniqueServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		Clinique clinique = (Clinique) session.getAttribute("clinique");
		request.setAttribute("clinique", clinique);
		System.out.println(clinique.toString());
		List<Docteur> docteurs = clinique.getDocteurs();
		request.setAttribute("nbrDoctors", docteurs.size());
		
		List<Commentaire> comments = Instances.commentImpl.getCommentsClinique(clinique.getCin(), "idClinique", false);
		request.setAttribute("comments", comments);
		
		request.setAttribute("nbrComments", comments != null ? comments.size() : 0);
		
		request.setAttribute("allDocteurs", Instances.docteurDao.getAll());
		request.setAttribute("docteurImpl", Instances.docteurImpl);
		
		request.setAttribute("doctors", docteurs);
		request.setAttribute("nbrDoctors", docteurs.size());
		Instances.languages.clear();
		request.setAttribute("Instances", new Instances());
		
		request.setAttribute("nbrVisiters", Instances.cliniqueImpl.getNumberOfVisiters(clinique));
		
		request.setAttribute("nbrRating", Instances.ratingImpl.getNumberOfRating(clinique.getCin(), "idClinique"));
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/dashboardClinique.jsp").forward(request, response);
	}

}
