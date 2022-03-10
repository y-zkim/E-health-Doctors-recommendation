package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.Implementations.DocteurDao;
import metier.dao.beans.Clinique;
import metier.dao.beans.Docteur;
import metier.dao.util.Instances;

@WebServlet("/clinicInfo")
public class CliniqueInfoConfirmation extends HttpServlet {
	
	public static final String VUE              = "/WEB-INF/clinicInfo.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if ( session.getAttribute("admin") != null ) {
			String id=request.getParameter("id");
			Clinique clinique = Instances.cliniqueDao.getById(Long.valueOf(id));
			request.setAttribute("clinic", clinique);
			this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
		} else {
			response.sendRedirect(request.getContextPath() + "/Home");
		}
            
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	}

}
