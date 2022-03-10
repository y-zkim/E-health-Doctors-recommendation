package web.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileAdmin")
public class ProfileAdminServlet extends HttpServlet {
	
	private static final String CHAMP_PASSWORD = "password";
	private static final String CHAMP_ADRESSE = "adresse";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_TEL = "tel";
	private static final String CHAMP_ID = "id";
	private static final String CHAMP_CONFIRMATION_PASSWORD = "confirmation_password";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
