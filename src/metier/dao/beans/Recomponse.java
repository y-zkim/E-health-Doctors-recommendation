package metier.dao.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Recomponse implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idRecomponse;
	private String name;
	private String annee;
	
	@ManyToOne
    @JoinColumn( name = "idDocteur", referencedColumnName = "cin" )
    private Docteur     docteur;
	
	public Recomponse() {
		super();
	}

	public long getIdRecomponse() {
		return idRecomponse;
	}

	public void setIdRecomponse(long idRecomponse) {
		this.idRecomponse = idRecomponse;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAnnee() {
		return annee;
	}

	public void setAnnee(String annee) {
		this.annee = annee;
	}
	
	public Docteur getDocteur() {
		return docteur;
	}
	
	public void setDocteur(Docteur docteur) {
		this.docteur = docteur;
	}
	
	
}
