package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Clinique;
import metier.dao.beans.Docteur;
import metier.dao.util.Instances;

@WebServlet("/EuthentificationDoc")
public class EuthentificationDocteurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String OLD_PASS = "oldMdp";
	private static final String NEW_PASS = "newMdp";
	private static final String CONFIR_PASS = "confirmationNewMdp";
	private static final String ID = "id";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if ( session.getAttribute("docteur") != null) {
			String id = request.getParameter(ID);
			String old = request.getParameter(OLD_PASS);
			String newpass = request.getParameter(NEW_PASS);
			String confirmation = request.getParameter(CONFIR_PASS);
			
			Docteur docteur  = Instances.docteurDao.getById(Long.valueOf(id));
			
			if (docteur.getPassword().equals(old)) {
				if (newpass.equals(confirmation)) {
					docteur.setPassword(newpass);
					Docteur dc = Instances.docteurDao.edit(docteur);
					session.setAttribute("docteur", dc);
					response.sendRedirect(request.getContextPath() + "/DataDoctor");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/DataDoctor");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/Home");
		}
		
	}

}
