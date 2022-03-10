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

@WebServlet("/docsInfo")
public class DoctorInfoConfirmation extends HttpServlet {
	
	public static final String VUE              = "/WEB-INF/docsInfo.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		Docteur doc= Instances.docteurDao.getById(Long.valueOf(id));
		System.out.println(doc.toString());
		request.setAttribute("doc", doc);
		HttpSession session = request.getSession(false);
		if ( session.getAttribute("admin") != null ) {
			this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
		} else {
			response.sendRedirect(request.getContextPath() + "/Home");
		}
            
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        
	}

}
