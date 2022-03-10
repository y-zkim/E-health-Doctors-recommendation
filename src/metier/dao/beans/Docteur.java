package metier.dao.beans;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Transient;

@Entity
@PrimaryKeyJoinColumn(name = "cin")
public class Docteur extends User{
       private String username;	
	    private String speciality;
	    private String adresse;
	    private String heureDepart;
	    private String heureFin;
	    private String jourDepart;
	    private String jourFin;
	    private Boolean teleMedcine;
	    private Boolean consultationDomicile;
	    private String gender;
	    private Boolean dispo;
	    private Boolean admin_confirmation;
	    private int age;
	    private String ville;
	    private Boolean conger;
	    private String description;
	    private Boolean rtelephonique;
	    private String biographie;
	    private String id;
	    private Boolean first_using;
	    private Long nbrVisiters;
	    @Transient
	    private String Base64image;
	    
	    @ManyToMany
	    @JoinTable( name = "T_Langue_Docteur",
	                joinColumns = @JoinColumn( name = "cin" ),
	                inverseJoinColumns = @JoinColumn( name = "idLangue" ) )
	    private List<Langue> langues = new ArrayList<>();
	    
	    @ManyToMany
	    @JoinTable( name = "T_Clinique_Docteur",
	                joinColumns = @JoinColumn( name = "email" ),
	                inverseJoinColumns = @JoinColumn( name = "cin" ) )
	    private List<Clinique> cliniques = new ArrayList<>();
	    
	    @ManyToMany
	    @JoinTable( name = "T_Hopital_Docteur",
	                joinColumns = @JoinColumn( name = "cin" ),
	                inverseJoinColumns = @JoinColumn( name = "idHopital" ) )
	    private List<Hopital> hopitales = new ArrayList<>();
	    
		@Lob
	    @Column(name = "profile_image", columnDefinition="LONGBLOB")
	    private byte[] profile_image;
		
	    @Transient
		@ManyToOne
		@JoinColumn(name = "idUser" , referencedColumnName = "cin")
		private User user;
		
	
		public Docteur() {
			super();
		}
		
		public User getUser() {
			return user;
		}
		
		public void setUser(User user) {
			this.user = user;
		}
	
		public String getSpeciality() {
			return speciality;
		}
	
		public void setSpeciality(String speciality) {
			this.speciality = speciality;
		}
	
		public byte[] getProfile_image() {
			return profile_image;
		}
	
		public void setProfile_image(byte[] profile_image) {
			this.profile_image = profile_image;
		}
		
	    public String getBase64image() {
				return Base64image;
		}

		public void setBase64image(String base64image) {
			Base64image = base64image;
		}
		
		public void base64(byte[] bytes,Docteur doc) throws UnsupportedEncodingException {
		    byte[] encodeBase64 = Base64.getDecoder().decode(bytes);
	        String base64Encoded = new String(encodeBase64, "UTF-8");
	        doc.setBase64image(base64Encoded);
	    }

		public List<Langue> getLangues() {
			return langues;
		}

		public void setLangues(List<Langue> langues) {
			this.langues = langues;
		}

		public Boolean getDispo() {
			return dispo;
		}

		public void setDispo(Boolean dispo) {
			this.dispo = dispo;
		}	
		
		public String getAdresse() {
			return adresse;
		}
		
		public void setAdresse(String adresse) {
			this.adresse = adresse;
		}

		public Boolean getTeleMedcine() {
			return teleMedcine;
		}

		public void setTeleMedcine(Boolean teleMedcine) {
			this.teleMedcine = teleMedcine;
		}

		public Boolean getConsultationDomicile() {
			return consultationDomicile;
		}

		public void setConsultationDomicile(Boolean consultationDomicile) {
			this.consultationDomicile = consultationDomicile;
		}
		
		public String getGender() {
			return gender;
		}
		
		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getHeureDepart() {
			return heureDepart;
		}

		public void setHeureDepart(String heureDepart) {
			this.heureDepart = heureDepart;
		}

		public String getHeureFin() {
			return heureFin;
		}

		public void setHeureFin(String heureFin) {
			this.heureFin = heureFin;
		}

		public String getJourDepart() {
			return jourDepart;
		}

		public void setJourDepart(String jourDepart) {
			this.jourDepart = jourDepart;
		}

		public String getJourFin() {
			return jourFin;
		}

		public void setJourFin(String jourFin) {
			this.jourFin = jourFin;
		}
		
		
		public int getAge() {
			return age;
		}
		
		public void setAge(int age) {
			this.age = age;
		}
		
		public void setDescription(String description) {
			this.description = description;
		}
		
		public String getDescription() {
			return description;
		}
		
		public void setConger(Boolean conger) {
			this.conger = conger;
		}
		
		public Boolean getConger() {
			return conger;
		}
		
		public Boolean getRtelephonique() {
			return rtelephonique;
		}
		
		public void setRtelephonique(Boolean rtelephonique) {
			this.rtelephonique = rtelephonique;
		}

		public List<Clinique> getCliniques() {
			return cliniques;
		}

		public void setCliniques(List<Clinique> cliniques) {
			this.cliniques = cliniques;
		}

		public List<Hopital> getHopitales() {
			return hopitales;
		}

		public void setHopitales(List<Hopital> hopitales) {
			this.hopitales = hopitales;
		}
		
		public String getBiographie() {
			return biographie;
		}
		
		public void setBiographie(String biographie) {
			this.biographie = biographie;
		}
		
		public String getId() {
			return id;
		}
		
		public void setId(String id) {
			this.id = id;
		}

		public String getVille() {
			return ville;
		}

		public void setVille(String ville) {
			this.ville = ville;
		}
		
		public Boolean getFirst_using() {
			return first_using;
		}
		
		public void setFirst_using(Boolean first_using) {
			this.first_using = first_using;
		}
		
		public Long getNbrVisiters() {
			return nbrVisiters;
		}
		
		public void setNbrVisiters(Long nbrVisiters) {
			this.nbrVisiters = nbrVisiters;
		}
		
		public Boolean getAdmin_confirmation() {
			return admin_confirmation;
		}
		
		public void setAdmin_confirmation(Boolean admin_confirmation) {
			this.admin_confirmation = admin_confirmation;
		}
		

}
