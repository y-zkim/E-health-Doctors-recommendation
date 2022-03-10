package web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Commentaire;
import metier.dao.beans.Hopital;
import metier.dao.util.Instances;
import metier.services.CommentaireImpl;
import metier.services.DocteurImpl;
import metier.services.RatingImpl;

@WebServlet("/HospitalProfile")
public class HospitalProfileServlet extends HttpServlet {
       
	private static final String VUE = "/WEB-INF/hospitalProfile.jsp";
	
	Map<Integer, Long> map          = new HashMap<Integer, Long>();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session         = request.getSession(false);
		Hopital hopital             = (Hopital) session.getAttribute("DisplayProfileHospital");
		request.setAttribute("ratingImpl", Instances.ratingImpl);
		request.setAttribute("docteurImpl", Instances.docteurImpl);
		request.setAttribute("progressBar", Instances.ratingImpl.getPercentageOfEtoiles(hopital.getIdHopital(), "idHopital"));
		request.setAttribute("hopital", hopital);
		request.setAttribute("telephone", Instances.convertNumberPhone(hopital.getTel()));
		request.setAttribute("nbrRating", Instances.ratingImpl.getNumberOfRating(hopital.getIdHopital(), "idHopital"));
		request.setAttribute("average", Instances.ratingImpl.average(hopital.getIdHopital(), "idHopital"));
		request.setAttribute("averageRating", Instances.ratingImpl.getAverageOfRating(hopital.getIdHopital(), "idHopital"));
		request.setAttribute("distinctValueRating", Instances.ratingImpl.countDistinctValueOfRate(hopital.getIdHopital(), "idHopital"));
		request.setAttribute("comments", Instances.commentImpl.getComments(hopital.getIdHopital(),"idHopital"));
		request.setAttribute("docteurs", hopital.getDocteurs());
		this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
