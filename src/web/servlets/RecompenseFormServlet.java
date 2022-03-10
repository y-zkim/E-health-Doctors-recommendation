package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Docteur;
import metier.dao.beans.Recomponse;
import metier.dao.util.Instances;

@WebServlet("/RecompenseForm")
public class RecompenseFormServlet extends HttpServlet {
	
	private static final String CHAMP_RECOMPENSE = "NomRecompense";
	private static final String CHAMP_DATE = "anneeRecompense";
	private static final String DOCTEUR = "doc";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("docteur") != null) {
			
			String id = request.getParameter(DOCTEUR);
			
			Docteur docteur = Instances.docteurDao.getById(Long.valueOf(id));
			session.setAttribute("docteur", docteur);
			String recompen = request.getParameter(CHAMP_RECOMPENSE);
			String date = request.getParameter(CHAMP_DATE);
			Recomponse recompense = new Recomponse();
			
			recompense.setAnnee(date);
			recompense.setName(recompen);
			recompense.setDocteur(docteur);
			
			Instances.recomDao.add(recompense);
			
			response.sendRedirect( request.getContextPath() + "/DataDoctor");
			
		} else {
			this.getServletContext().getRequestDispatcher("/Home").forward(request, response);
		}
		
	}
	

}
