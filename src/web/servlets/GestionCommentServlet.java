package web.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.Implementations.CommentaireDao;
import metier.dao.Implementations.DocteurDao;
import metier.dao.beans.Commentaire;
import metier.dao.util.Instances;
import metier.services.CliniqueImpl;
import metier.services.CommentaireImpl;
import metier.services.DocteurImpl;
import metier.services.UserImpl;

@WebServlet("/GestionComment")
public class GestionCommentServlet extends HttpServlet {
	
	private static final String CHAMP_APPROVE = "apprv";
	private static final String CHAMP_DELETE  = "dlte";
	private static final String VUE  = "/WEB-INF/AdminDashboard.jsp";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Commentaire commentaire = new Commentaire();
		HttpSession session = request.getSession();
		String approve = request.getParameter(CHAMP_APPROVE);
		String delete  = request.getParameter(CHAMP_DELETE);
		String delete_comment_clinique  = request.getParameter("delete_comment_clinique");
		
		if (approve != null) {
			commentaire = Instances.commentDao.getById(Long.valueOf(approve));
			commentaire.setApprov(true);
			if (session.getAttribute("admin") != null) {
				Instances.commentDao.edit(commentaire);
			}
			List<Commentaire> comments = Instances.commentImpl.getCommentsNotApproved(false, false);
			request.setAttribute("comments", comments);
			request.setAttribute("clinics", Instances.cliniqueImpl.getAllClinicsAccordingToTheirAvailability( false ));
			request.setAttribute("docs", Instances.docteurImpl.getDoctorsAccordingToTheirAvailability(false));
			request.setAttribute("nbrUsers", Instances.userImpl.getNumbersOfUser("User") != null ? Instances.userImpl.getNumbersOfUser("User") : 0 );
			request.setAttribute("nbrDoctors", Instances.userImpl.getNumbersOfUser("Docteur") != null ? Instances.userImpl.getNumbersOfUser("Docteur") : 0  );
			request.setAttribute("nbrPharmacies", Instances.userImpl.getNumbersOfUser("Pharmacie") != null ? Instances.userImpl.getNumbersOfUser("Pharmacie") : 0 );
			request.setAttribute("nbrClinics", Instances.userImpl.getNumbersOfUser("Clinique") != null ? Instances.userImpl.getNumbersOfUser("Clinique") : 0  );
			
			this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
		}
		
		if (delete != null) {
			commentaire = Instances.commentDao.getById(Long.valueOf(delete));
			commentaire.setDel(true);
			if (session.getAttribute("admin") != null) {
				Instances.commentDao.edit(commentaire);
			}
			List<Commentaire> comments = Instances.commentImpl.getCommentsNotApproved(false, false);
			request.setAttribute("comments", comments);
			request.setAttribute("clinics", Instances.cliniqueImpl.getAllClinicsAccordingToTheirAvailability( false ));
			request.setAttribute("docs", Instances.docteurImpl.getDoctorsAccordingToTheirAvailability(false));
			request.setAttribute("nbrUsers", Instances.userImpl.getNumbersOfUser("User") != null ? Instances.userImpl.getNumbersOfUser("User") : 0 );
			request.setAttribute("nbrDoctors", Instances.userImpl.getNumbersOfUser("Docteur") != null ? Instances.userImpl.getNumbersOfUser("Docteur") : 0  );
			request.setAttribute("nbrPharmacies", Instances.userImpl.getNumbersOfUser("Pharmacie") != null ? Instances.userImpl.getNumbersOfUser("Pharmacie") : 0 );
			request.setAttribute("nbrClinics", Instances.userImpl.getNumbersOfUser("Clinique") != null ? Instances.userImpl.getNumbersOfUser("Clinique") : 0  );
			
			this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
		}
		
		if ( delete_comment_clinique != null) {
			Commentaire c = Instances.commentDao.getById(Long.valueOf(delete_comment_clinique));
			System.out.println(c.toString());
			System.out.println(c.getCommentaire());
			c.setDel(true);
			Commentaire r = Instances.commentDao.edit(c);
			System.out.println(r.toString());
			response.sendRedirect( request.getContextPath() + "/DataClinique");
			//this.getServletContext().getRequestDispatcher("/DataClinique").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
