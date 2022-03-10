package metier.dao.beans;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
//@PrimaryKeyJoinColumn(name = "idProfil")
public class Pharmacie implements Serializable{

	@Id
	@GeneratedValue( strategy = GenerationType.IDENTITY )
	private Long idPharmacie;
	private String name;
	private String ville;
	private String email;
	private String tel;
	private String adresse;
	private String id;
	private Boolean dispo;
	private Boolean en_garde;
	
	public Pharmacie() {
		super();
	}
	
	public String getAdresse() {
		return adresse;
	}
	
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public Long getIdPharmacie() {
		return idPharmacie;
	}
	
	public void setIdPharmacie(Long idPharmacie) {
		this.idPharmacie = idPharmacie;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}
	
	public Boolean getDispo() {
		return dispo;
	}
	
	public void setDispo(Boolean dispo) {
		this.dispo = dispo;
	}

	public Boolean getEn_garde() {
		return en_garde;
	}

	public void setEn_garde(Boolean en_garde) {
		this.en_garde = en_garde;
	}

	@Override
	public String toString() {
		return "Pharmacie [idPharmacie=" + idPharmacie + ", name=" + name + ", ville=" + ville + ", dispo=" + dispo
				+ ", en_garde=" + en_garde + "]";
	}
	
	
	
}
