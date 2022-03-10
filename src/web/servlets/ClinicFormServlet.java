package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.dao.Implementations.CliniqueDao;
import metier.dao.Implementations.RoleDao;
import metier.dao.Implementations.UserDao;
import metier.dao.beans.Clinique;
import metier.dao.beans.Role;
import metier.dao.beans.User;
import metier.dao.util.Instances;
import metier.services.CliniqueImpl;
import metier.services.RoleImpl;
import metier.services.UserImpl;
import metier.services.CliniqueFormImpl;

@WebServlet("/clinicForm")
public class ClinicFormServlet extends HttpServlet {
    
    public static final String ATT_CLINIC       = "clinic";
    public static final String ATT_FORM         = "form";
    public static final String ATT_RESULTAT     = "resultat";
    public static final String ATT_ERROR        = "erreurs";
    public static final String VUE              = "/WEB-INF/ClinicForm.jsp";
    public static final String SUCESS           = "/WEB-INF/SuccessMS.jsp";
    
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// afficher la formulaire d'inscription d'un clinuque au client
		Instances.languages.clear();
        request.setAttribute("Instances", new Instances());
		this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CliniqueFormImpl form     = CliniqueFormImpl.getInstance();
		form.getErreurs().clear();
    	Clinique clinic           = form.clinicFormService(request);

        request.setAttribute( ATT_CLINIC, clinic );
        request.setAttribute( ATT_FORM, form );
        

        if ( form.getErreurs().isEmpty() ) {
        	
        	Role role = new Role();

            role = Instances.roleImpl.getRolebyrole("clinique");
       
            clinic.setRole(role);
            
            Instances.cliniqueDao.add(clinic);

            this.getServletContext().getRequestDispatcher( SUCESS ).forward(request, response );

        } else {
        	
            this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );

        }

	}

}
