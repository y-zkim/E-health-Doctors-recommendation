package web.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.Implementations.CommentaireDao;
import metier.dao.Implementations.DocteurDao;
import metier.dao.Implementations.UserDao;
import metier.dao.beans.Commentaire;
import metier.dao.beans.Docteur;
import metier.dao.beans.User;
import metier.dao.util.Instances;
import metier.services.CliniqueImpl;
import metier.services.CommentaireImpl;
import metier.services.DocteurImpl;
import metier.services.SignInFormService;
import metier.services.UserImpl;

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {	
	
    private static final String ATT_VISITER      = "visiter";
    private static final String ATT_FORM         = "form";
    private static final String ATT_RESULTAT     = "resultat";
    private static final String ATT_ERROR        = "erreurs";
    private static final String VUE              = "/WEB-INF/SignIn.jsp";
    private static final String SUCESS_USER      = "/Home";
    private static final String SUCESS_ADMIN     = "/toAdminData";
    private static final String SUCESS_DOCTEUR   = "/DataDoctor";
    private static final String SUCESS_CLINIQUE  = "/DataClinique";
   
    private Boolean aide = false;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		SignInFormService form = SignInFormService.getInstance();
        
    	User visiter = form.SignInService( request );

    	HttpSession session = request.getSession();
    	
    	if ( visiter != null) {
    		if ( form.getErreurs().isEmpty() && visiter.getRole().getRole().equals("admin") ) {
        		session.setAttribute("admin", visiter);
        		response.sendRedirect( request.getContextPath() + SUCESS_ADMIN);
    			
    		} else if ( form.getErreurs().isEmpty() && visiter.getRole().getRole().equals("utilisateur") ) {
        			System.out.println("utilisateur");
    				session.setAttribute("visiter", visiter);
    				response.sendRedirect( request.getContextPath() + SUCESS_USER);    			
            	
    		} else if ( form.getErreurs().isEmpty() && visiter.getRole().getRole().equals("docteur") ) {
        		
        		Docteur docteur = Instances.docteurDao.getById(visiter.getCin());
        		
            	session.setAttribute("docteur", docteur);
            	response.sendRedirect( request.getContextPath() + SUCESS_DOCTEUR);
            	
    		} else if ( form.getErreurs().isEmpty() && visiter.getRole().getRole().equals("clinique") ) {

        		session.setAttribute("clinique", visiter);
        		response.sendRedirect( request.getContextPath() + SUCESS_CLINIQUE);
        		
    		} else {

    			request.setAttribute(ATT_FORM, form);
    			this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    			
    		}
		} else {
			request.setAttribute("message_erreur", "votre email ou bien password est incorrect");
			this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
		}
    	
    	

	}
	
	

}
