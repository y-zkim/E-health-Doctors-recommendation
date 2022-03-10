package web.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.dao.beans.Clinique;
import metier.dao.beans.Docteur;
import metier.dao.util.Instances;


@WebServlet("/cliniqueAssociation")
public class cliniqueAssociation extends HttpServlet {

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if ( session.getAttribute("clinique") != null) {
			Boolean existe = false;
			
			String idDocteur = request.getParameter("id");
			
			String docteurId = request.getParameter("docteurId");
			
			
			String idClinique = request.getParameter("idClinique");
			
			Clinique clinique = Instances.cliniqueDao.getById(Long.valueOf(idClinique));
			
			List<Docteur> docteurs = clinique.getDocteurs();
			
			if (idDocteur != null) {
				Docteur doc = Instances.docteurDao.getById(Long.valueOf(idDocteur));
				
				for(Docteur d : docteurs) {
					if ( d.getCin() == doc.getCin()) {
						existe = true;
					}
				}
				
				if (!existe) {
					
					docteurs.add(doc);
					clinique.setDocteurs(docteurs);
					Clinique clinic = Instances.cliniqueDao.edit(clinique);
					session.setAttribute("clinique", clinic);
				}
			}
			
			if (docteurId != null && !docteurs.isEmpty()) {
				Docteur doc_2 = Instances.docteurDao.getById(Long.valueOf(docteurId));
				Docteur aide_docteur = null;
				for(Docteur d : docteurs) {
					if(d.getCin() == doc_2.getCin()) {
						aide_docteur = d;
					}
				}
				if (aide_docteur != null) {
					docteurs.remove(aide_docteur);
					clinique.setDocteurs(docteurs);
					Clinique clinic = Instances.cliniqueDao.edit(clinique);
					session.setAttribute("clinique", clinic);
				}
			}
			response.sendRedirect( request.getContextPath() + "/DataClinique");
		} else {
			response.sendRedirect( request.getContextPath() + "/Home");
		}
		
		//this.getServletContext().getRequestDispatcher("/DataClinique").forward(request, response);
	}

}
