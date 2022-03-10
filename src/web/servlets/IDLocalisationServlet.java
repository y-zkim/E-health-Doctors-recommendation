package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Docteur;
import metier.dao.util.Instances;

@WebServlet("/IDLocalisation")
public class IDLocalisationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String place_id = request.getParameter("place_id");
		String loca_id = request.getParameter("loca_id");
		
		Docteur docteur = Instances.docteurDao.getById(Long.valueOf(loca_id));
		
		Docteur d = Instances.docteurDao.edit(docteur);
		
		HttpSession session = request.getSession(false);
		session.setAttribute("docteur", d);
		response.sendRedirect( request.getContextPath() + "/DataDoctor");
		//this.getServletContext().getRequestDispatcher("/DataDoctor").forward(request, response);
	}

}
