package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Deconnexion")
public class DeconnexionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session_visiter = request.getSession(false);
		if (session_visiter != null) {
			if (session_visiter.getAttribute("visiter") != null) {
				session_visiter.invalidate();
				session_visiter.setMaxInactiveInterval(0);
				response.sendRedirect(request.getContextPath() + "/Home");
				return;
			}
		}
		HttpSession session_docteur = request.getSession(false);
		if (session_docteur != null) {
			if (session_docteur.getAttribute("docteur") != null) {
				session_docteur.invalidate();
				session_docteur.setMaxInactiveInterval(0);
				response.sendRedirect(request.getContextPath() + "/Home");
				return;
			}
		}
		HttpSession session_admin = request.getSession(false);
		if (session_admin != null) {
			if (session_admin.getAttribute("admin") != null) {
				System.out.println(session_admin);
				session_admin.invalidate();
				session_admin.setMaxInactiveInterval(0);
				System.out.println(session_admin);
				System.out.println("la session existe ou pas ?");
				response.sendRedirect(request.getContextPath() + "/Home");
				return;
			}
		}
		HttpSession session_clinique = request.getSession(false);
		if (session_clinique != null) {
			if (session_clinique.getAttribute("clinique") != null) {
				session_clinique.invalidate();
				session_clinique.setMaxInactiveInterval(0);
				response.sendRedirect(request.getContextPath() + "/Home");
				return;
			}
		}
		HttpSession session = request.getSession(false);
		if (session == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/Home.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
