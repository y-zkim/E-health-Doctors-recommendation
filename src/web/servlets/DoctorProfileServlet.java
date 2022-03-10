package web.servlets;

import java.io.IOException;
import java.util.Base64;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.Implementations.DocteurDao;
import metier.dao.beans.Clinique;
import metier.dao.beans.Commentaire;
import metier.dao.beans.Docteur;
import metier.dao.beans.Hopital;
import metier.dao.util.Instances;
import metier.services.CommentaireImpl;
import metier.services.DocteurImpl;
import metier.services.EducationImpl;
import metier.services.RatingImpl;
import metier.services.RecompenseImpl;

@WebServlet("/doctorProfile")
public class DoctorProfileServlet extends HttpServlet {
	
	private static final String VUE    = "/WEB-INF/doctorProfile.jsp";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// recuperer le docteur choisi par le client
		Docteur d = new Docteur();
		Docteur i = (Docteur) request.getAttribute("docteur");
		String id = request.getParameter("docteur");
		if ( i != null) {
			d                     = i;
		}
		if (id != null) {
			d                     = Instances.docteurDao.getById(Long.valueOf(id));
		}
		
		
		d.setNbrVisiters(d.getNbrVisiters() + 1);
		Docteur docteur = Instances.docteurDao.edit(d);
		
		List<Commentaire> lcomments = Instances.commentImpl.getComments(docteur.getCin(),"idDocteur");
		List<Clinique> lc           = docteur.getCliniques();
		List<Hopital> lh            = docteur.getHopitales();
		// les données du docteur dans un map pour les afficher dans la page du profile
		request.setAttribute("data", Instances.docteurImpl.displayDataInProfilePage(docteur));
		request.setAttribute("ratingImpl", Instances.ratingImpl);
		request.setAttribute("doctor", docteur);
		request.setAttribute("hopitaux", lh);
		request.setAttribute("cliniques", lc);
		request.setAttribute("progressBar", Instances.ratingImpl.getPercentageOfEtoiles(docteur.getCin(), "idDocteur"));
		request.setAttribute("image", Base64.getEncoder().encodeToString(docteur.getProfile_image()));
		request.setAttribute("comments", lcomments);
		// different valeurs de l'evaluation des client
		request.setAttribute("evaluations", Instances.ratingImpl.countDistinctValueOfRate(docteur.getCin(), "idDocteur") );
		request.setAttribute("nbrRating", Instances.ratingImpl.getNumberOfRating(docteur.getCin(), "idDocteur"));
		request.setAttribute("average", Instances.ratingImpl.average(docteur.getCin(), "idDocteur"));
		request.setAttribute("nbr", Instances.ratingImpl.getAverageOfRating(docteur.getCin(), "idDocteur"));
		request.setAttribute("recompenses", Instances.recomImpl.getRecompenseByDoctor(docteur));
		request.setAttribute("educations", Instances.educImpl.getEducationByDoctor(docteur));
		this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
