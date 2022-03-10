package web.servlets;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Clinique;
import metier.dao.beans.Commentaire;
import metier.dao.beans.Docteur;
import metier.dao.beans.Hopital;
import metier.dao.beans.Pharmacie;
import metier.dao.util.Instances;
import metier.services.DocteurImpl;

@WebServlet("/admin")
public class AdminDashBoardServlet extends HttpServlet {
	
	public static final String VUE              = "/WEB-INF/AdminDashboard.jsp";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		String delete = request.getParameter("dlte");
		String show = request.getParameter("show");
		
		String deleteClinique = request.getParameter("dlte_clinique");
		String showClinique = request.getParameter("show_clinique");
		
		String deletePharmacie = request.getParameter("dlte_pharmacie");
		
		String deleteHopital = request.getParameter("dlte_hopital");
		String showHopital = request.getParameter("show_hopital");
		
		if (delete != null) {
			Docteur docteur = Instances.docteurDao.getById(Long.valueOf(delete));
			docteur.setDispo(false);
			Instances.docteurDao.edit(docteur);
			if (session.getAttribute("admin") != null) {
				response.sendRedirect( request.getContextPath() + "/toAdminData");
			} else {
				response.sendRedirect( request.getContextPath() + "/Home");
			}
			//this.getServletContext().getRequestDispatcher( "/toAdminData" ).forward( request, response );
		}
		
		if (show != null) {
			Docteur docteur = Instances.docteurDao.getById(Long.valueOf(show));
			request.setAttribute("docteur", docteur);
			if (session.getAttribute("admin") != null) {
				response.sendRedirect( request.getContextPath() + "/doctorProfile");
			} else {
				response.sendRedirect( request.getContextPath() + "/Home");
			}
			//this.getServletContext().getRequestDispatcher( "/doctorProfile" ).forward( request, response );
		}
		
		if (deleteClinique != null) {
			Clinique clinique = Instances.cliniqueDao.getById(Long.valueOf(deleteClinique));
			clinique.setDispo(false);
			Instances.cliniqueDao.edit(clinique);
			if (session.getAttribute("admin") != null) {
				response.sendRedirect( request.getContextPath() + "/toAdminData");
			} else {
				response.sendRedirect( request.getContextPath() + "/Home");
			}
			//this.getServletContext().getRequestDispatcher( "/toAdminData" ).forward( request, response );
		}
		
		if (showClinique != null) {
			Clinique clinique = Instances.cliniqueDao.getById(Long.valueOf(showClinique));
			request.setAttribute("clinique", clinique);
			session.setAttribute("DisplayProfileClinique", clinique);
			if (session.getAttribute("admin") != null) {
				response.sendRedirect( request.getContextPath() + "/CliniqueProfile");
			} else {
				response.sendRedirect( request.getContextPath() + "/Home");
			}
			//this.getServletContext().getRequestDispatcher( "/CliniqueProfile" ).forward( request, response );
		}
		
		if (showHopital != null) {
			Hopital hopital = Instances.hopitalDao.getById(Long.valueOf(showHopital));
			request.setAttribute("hopital", hopital);
			session.setAttribute("DisplayProfileHospital", hopital);
			if (session.getAttribute("admin") != null) {
				response.sendRedirect( request.getContextPath() + "/HospitalProfile");
			} else {
				response.sendRedirect( request.getContextPath() + "/Home");
			}
			//this.getServletContext().getRequestDispatcher( "/HospitalProfile" ).forward( request, response );
		}
		
		if (deletePharmacie != null) {
			Pharmacie pharmacie = Instances.pharmacieDao.getById(Long.valueOf(deletePharmacie));
			pharmacie.setDispo(false);
			Instances.pharmacieDao.edit(pharmacie);
			if (session.getAttribute("admin") != null) {
				response.sendRedirect( request.getContextPath() + "/toAdminData");
			} else {
				response.sendRedirect( request.getContextPath() + "/Home");
			}
			//this.getServletContext().getRequestDispatcher( "/toAdminData" ).forward( request, response );
		}
		
		if (deleteHopital != null) {
			Hopital hopital = Instances.hopitalDao.getById(Long.valueOf(deleteHopital));
			hopital.setDispo(false);
			Instances.hopitalDao.edit(hopital);
			if (session.getAttribute("admin") != null) {
				response.sendRedirect( request.getContextPath() + "/toAdminData");
			} else {
				response.sendRedirect( request.getContextPath() + "/Home");
			}
			//this.getServletContext().getRequestDispatcher( "/toAdminData" ).forward( request, response );
		}
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
