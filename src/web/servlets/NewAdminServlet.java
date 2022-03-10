package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.User;
import metier.dao.util.Instances;

@WebServlet("/NewAdmin")
public class NewAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
		if ( session.getAttribute("admin") != null) {
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String email = request.getParameter("email");
			String telephone = request.getParameter("phone");
			
			User u = Instances.userImpl.VerifyEmail(email);
			
			if (u == null) {
				String password = Instances.send.generateRandomPassword(8);
				String messages = " vous etes ajouter comme un admin dans l'application e-health est voici votre mot de pass -- " + password;
				
				User user = new User();
				user.setEmail(email);
				user.setFirstname(prenom);
				user.setLastname(nom);
				
				user.setPassword(password);
				user.setTel(telephone);
				user.setRole(Instances.roleDao.getById(1));
				Instances.send.sendEMailToUser(messages, email);
				Instances.userDao.add(user);
				
				response.sendRedirect(request.getContextPath() + "/toAdminData");
			} else {
				response.sendRedirect(request.getContextPath() + "/toAdminData");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/Home");
		}
		
	}

}
