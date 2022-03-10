package metier.dao.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;

@Entity
public class Langue implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idLangue;
	private String langue;
	
	@ManyToMany
    @JoinTable( name = "T_Langue_Docteur",
                joinColumns = @JoinColumn( name = "idLangue" ),
                inverseJoinColumns = @JoinColumn( name = "cin" ) )
    private List<Docteur> docteurs = new ArrayList<>();
	
	public Langue() {
		super();
	}
	
	public Long getIdLangue() {
		return idLangue;
	}
	public void setIdLangue(Long idLangue) {
		this.idLangue = idLangue;
	}
	public String getLangue() {
		return langue;
	}
	public void setLangue(String langue) {
		this.langue = langue;
	}

	public List<Docteur> getDocteurs() {
		return docteurs;
	}

	public void setDocteurs(List<Docteur> docteurs) {
		this.docteurs = docteurs;
	}
	
	
	
		
}
