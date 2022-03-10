package web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Langue;
import metier.dao.beans.Role;
import metier.dao.beans.User;
import metier.dao.util.Instances;


@WebServlet("/Home")
public class HomeServlet extends HttpServlet {
	
	
	private static final String VUE            = "/Home.jsp";
	List<Role> roles                           = new ArrayList<Role>();
	String[] langues						   = {"Arabic" , "Frensh", "English", "Chinese", "Spanish" };
    
    @Override
    public void init() throws ServletException {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			
			if ( session.getAttribute("admin") != null ) {
				response.sendRedirect(request.getContextPath() + "/toAdminData");
			} else if (session.getAttribute("docteur") != null) {
				response.sendRedirect(request.getContextPath() + "/DataDoctor");
			} else if (session.getAttribute("clinique") != null) {
				response.sendRedirect(request.getContextPath() + "/DataClinique");
			} else {
				this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
			}
			 
		}else {
			System.out.println("ici home 2");
			this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	

}
