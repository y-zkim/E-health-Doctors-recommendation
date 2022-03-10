package metier.dao.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

@Entity
public class Hopital implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long idHopital;
	private String name;
	private String adresse;
	private String description;
	private String tel;
	private String id;
	private String email;
	private String ville;
	private Boolean dispo;
	
	@ManyToMany
    @JoinTable( name = "T_Hopital_Docteur",
                joinColumns = @JoinColumn( name = "idHopital" ),
                inverseJoinColumns = @JoinColumn( name = "cin" ) )
    private List<Docteur> docteurs = new ArrayList<>();
	
	public Hopital() {
		super();
	}
	
	public void setIdHopital(long idHopital) {
		this.idHopital = idHopital;
	}
	
	public long getIdHopital() {
		return idHopital;
	}

	public List<Docteur> getDocteurs() {
		return docteurs;
	}

	public void setDocteurs(List<Docteur> docteurs) {
		this.docteurs = docteurs;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getVille() {
		return ville;
	}
	
	public void setVille(String ville) {
		this.ville = ville;
	}
	
	public Boolean getDispo() {
		return dispo;
	}
	
	public void setDispo(Boolean dispo) {
		this.dispo = dispo;
	}
	
	
}
