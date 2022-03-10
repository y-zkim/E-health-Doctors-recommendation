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

@WebServlet("/AdminProfile")
public class AdminProfileServlet extends HttpServlet {

	private static final String CHAMP_ANCIEN_PASSWORD = "acien_pass";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_TEL = "tel";
	private static final String CHAMP_NV_PASS = "nv_pass";
	private static final String CHAMP_ID = "id";
	private static final String CHAMP_CONFIR_PASSWORD = "confirmation_password";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String acien_pass   = request.getParameter(CHAMP_ANCIEN_PASSWORD);
		String id   = request.getParameter(CHAMP_ID);
		String email = request.getParameter(CHAMP_EMAIL);
		String nv_pass      = request.getParameter(CHAMP_NV_PASS);
		String tel     = request.getParameter(CHAMP_TEL);
		String confirmation_password     = request.getParameter(CHAMP_CONFIR_PASSWORD);
		
		User user = Instances.userDao.getById(Long.valueOf(id));
		
		user.setEmail(email);
		user.setTel(tel);
		System.out.println(acien_pass);
		System.out.println(email);
		User u = Instances.signInService.VerifyUser(email, acien_pass);
		System.out.println("from admin profile " + u);
		if ( u != null && session.getAttribute("admin") != null ) {
			if (nv_pass.equals(confirmation_password) ) {
				user.setPassword(nv_pass);
				Instances.userDao.edit(user);
				response.sendRedirect( request.getContextPath() + "/toAdminData");
			}
		} else if ( u == null && session.getAttribute("admin") != null) {
			response.sendRedirect( request.getContextPath() + "/toAdminData");
		} else {
			response.sendRedirect( request.getContextPath() + "/Home");
		}
	}

}
