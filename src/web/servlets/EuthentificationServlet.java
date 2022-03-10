package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Clinique;
import metier.dao.util.Instances;

@WebServlet("/Euthentification")
public class EuthentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String OLD_PASS = "oldMdp";
	private static final String NEW_PASS = "newMdp";
	private static final String CONFIR_PASS = "confirmationNewMdp";
	private static final String ID = "id";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if ( session.getAttribute("clinique") != null) {
			String id = request.getParameter(ID);
			String old = request.getParameter(OLD_PASS);
			String newpass = request.getParameter(NEW_PASS);
			String confirmation = request.getParameter(CONFIR_PASS);
			
			Clinique clinique = Instances.cliniqueDao.getById(Long.valueOf(id));
			
			if (clinique.getPassword().equals(old)) {
				if (newpass.equals(confirmation)) {
					clinique.setPassword(newpass);
					Clinique c = Instances.cliniqueDao.edit(clinique);
					session.setAttribute("clinique", c);
					response.sendRedirect(request.getContextPath() + "/DataClinique");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/DataClinique");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/Home");
		}
		
	}

}
