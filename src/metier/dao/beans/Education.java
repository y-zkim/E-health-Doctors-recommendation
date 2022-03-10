package metier.dao.beans;



import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Education implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idEducation;
	private String education;
	private String descEduc;
	private String anneeEduc;
	
	@ManyToOne
    @JoinColumn( name = "idDocteur", referencedColumnName = "cin" )
    private Docteur     docteur;
	
	public Education() {
		super();
	}

	public long getIdEducation() {
		return idEducation;
	}

	public void setIdEducation(long idEducation) {
		this.idEducation = idEducation;
	}

	public Docteur getDocteur() {
		return docteur;
	}

	public void setDocteur(Docteur docteur) {
		this.docteur = docteur;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getDescEduc() {
		return descEduc;
	}

	public void setDescEduc(String descEduc) {
		this.descEduc = descEduc;
	}

	public String getAnneeEduc() {
		return anneeEduc;
	}

	public void setAnneeEduc(String anneeEduc) {
		this.anneeEduc = anneeEduc;
	}
	
	

	
	
}
