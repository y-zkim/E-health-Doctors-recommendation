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


@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = new User();
		if ( session.getAttribute("visiter") != null) {
			user = (User) session.getAttribute("visiter");
			request.setAttribute("user", user);
			this.getServletContext().getRequestDispatcher("/WEB-INF/profileUser.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String changeInfo = request.getParameter("changeInfo");
		String changePass = request.getParameter("changePass");
		System.out.println("pass"+changePass);
		System.out.println("info"+changeInfo);
		
		
		
		HttpSession session = request.getSession(false);
		
		if (session.getAttribute("visiter") != null && changeInfo != null ) {
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String telephone = request.getParameter("tel");
			String email = request.getParameter("email");
			String last_pass = request.getParameter("last_pass");
			User u = Instances.userImpl.VerifyEmail(email);
			if (u != null) {
				u.setFirstname(prenom);
				u.setLastname(nom);
				u.setTel(telephone);
				User uu = Instances.userDao.edit(u);
				request.setAttribute("user", uu);
				session.setAttribute("visiter", uu);
				response.sendRedirect(request.getContextPath() + "/UserProfile");
			} else {
				response.sendRedirect(request.getContextPath() + "/Home");
			}
		}
		
		
		//pass
		if (session.getAttribute("visiter") != null && changePass != null ) {
			String email_pass = request.getParameter("email_pass");
			String last_pass = request.getParameter("last_pass");
			String new_pass = request.getParameter("new_pass");
			String confirmation = request.getParameter("confirmation");
			User user = Instances.signInService.VerifyUser(email_pass,last_pass);
			System.out.println("pas de :: "+user);
			if (user != null) {
				if (new_pass.equals(confirmation)) {
					System.out.println("les mot de pass sont egaux");
					user.setPassword(new_pass);
					User u_pass = Instances.userDao.edit(user);
					request.setAttribute("user", u_pass);
					session.setAttribute("visiter", u_pass);
					response.sendRedirect(request.getContextPath() + "/UserProfile");
				}
			} else {
				request.setAttribute("user", session.getAttribute("visiter"));
				response.sendRedirect(request.getContextPath() + "/Home");
			}
		}
		
	}
	
}
