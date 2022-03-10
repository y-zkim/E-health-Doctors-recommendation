package metier.services;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;


import metier.dao.beans.Docteur;
import metier.dao.beans.Langue;

public class DocteurFormService {
    private static final String CHAMP_FIRSTNAME       = "firstname";
    private static final String CHAMP_LASTNAME        = "lastname";
    private static final String CHAMP_EMAIL           = "email";
    private static final String CHAMP_SPECIALITY      = "speciality";
    private static final String CHAMP_TEL             = "tel";
    private static final String CHAMP_LANGUAGES       = "languages";
    private static final String CHAMP_PROFILE_IMAGE   = "profile_image";
    private static final String CHAMP_VILLE           = "ville";
    

    private String              resultat;
    private Map<String, String> erreurs               = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat( String resultat ) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Docteur doctorFormService( HttpServletRequest request ) throws IOException, ServletException {
    	String ville = request.getParameter(CHAMP_VILLE);
        String firstname   = request.getParameter( CHAMP_FIRSTNAME );
        String lastname    = request.getParameter( CHAMP_LASTNAME );
        String email       = request.getParameter( CHAMP_EMAIL );
        String tel         = request.getParameter( CHAMP_TEL );
        String speciality  = request.getParameter( CHAMP_SPECIALITY );
        String[] languages = request.getParameterValues( CHAMP_LANGUAGES );
        Part photofile     = request.getPart(CHAMP_PROFILE_IMAGE);
		
		InputStream inputStream = null;
		
		Docteur doctor = new Docteur();
		
		byte[] bite = null;
			    
	    if(photofile!=null) {
		    inputStream=photofile.getInputStream();
		    bite = convert(inputStream);
        }
	    doctor.setProfile_image( bite );
	    
        try {
            validationEmail( email );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_EMAIL, e.getMessage() );
        }
        doctor.setEmail( email );

        try {
            validationPrenom( firstname );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_FIRSTNAME, e.getMessage() );
        }
        doctor.setFirstname( firstname );

        try {
            validationNom( lastname );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_LASTNAME, e.getMessage() );
        }
        doctor.setLastname( lastname );

        try {
            validationTel( tel );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_TEL, e.getMessage() );
        }
        doctor.setTel( tel );
        
        
        LangueImpl langueImpl = LangueImpl.getInstance();
        List<Langue> les_langues = new ArrayList<>();
        if(languages!=null) {
        for(String lg : languages) {
        	Langue langue = langueImpl.getLangueByString(lg);
        	les_langues.add(langue);
          }
        }
        try {
            validationLangues( les_langues );
        } catch ( Exception e ) {
            erreurs.put( CHAMP_LANGUAGES, e.getMessage() );
        }
        
        doctor.setLangues(les_langues);
        doctor.setHeureDepart("9:00");
        doctor.setHeureFin("15:00");
        doctor.setJourDepart("Lundi");
        doctor.setJourFin("Vendredi");
        doctor.setConger(false);
        doctor.setDispo(false);
        doctor.setNbrVisiters(0L);
        doctor.setTeleMedcine(false);
        doctor.setRtelephonique(true);
        doctor.setConsultationDomicile(false);
        doctor.setAdmin_confirmation(false);
        doctor.setId("ChIJyRyt2um2sw0RdIT0i7fQ-Lw");
        doctor.setVille(ville.toLowerCase());
        doctor.setFirst_using(false);
        doctor.setSpeciality(speciality);

        
        if ( erreurs.isEmpty() ) {
            resultat = "Succés d'inscription!";
        } else {
            resultat = "Echec d'inscription";
        }
        
        return doctor;
    }
    
    
    
    private void validationImageID( byte[] bite ) throws Exception {
        if ( bite == null ) {
                throw new Exception( "Veuillez saisir un screeshot de votre carte nationale!" );
        }
    }
    
    private void validationImageCertificat( byte[] bite  ) throws Exception {
    	System.out.print("NOT null");

        if ( bite == null ) {
	    	System.out.print("nulllllll");

                throw new Exception( "Veuillez saisir un screeshot de votre certificat m�dical!" );
        }
    }
    
    private void validationImageLocalContract( byte[] bite ) throws Exception {
        if ( bite == null ) {
                throw new Exception( "Veuillez saisir un screeshot de votre contract de location!" );
        }
    }
    
    private void validationLangues( List<Langue> les_langues ) throws Exception {
        if ( les_langues.size() == 0 ) {
                throw new Exception( "Veuillez saisir la/les langues que vous parlez" );
        }
    }

    private void validationPrenom( String firstname ) throws Exception {
        if ( firstname != null ) {
            if ( firstname.trim().length() < 3 ) {
                throw new Exception( "Veuillez saisir un nom de plus de 3 caract�res." );
            }
        }
    }

    private void validationNom( String lastname ) throws Exception {
        if ( lastname != null ) {
            if ( lastname.trim().length() < 3 ) {
                throw new Exception( "Veuillez saisir un nom de plus de 3 caract�res." );
            }
        }
    }

    private void validationEmail( String email ) throws Exception {
        String regex = "([^.@]+)(\\\\.[^.@]+)*@([^.@]+\\\\.)+([^.@]+)";
        if ( email != null && email.trim().length() != 0 ) {
            if ( email.matches( regex ) ) {
                throw new Exception( "adresse email valid�" );
            }

        } else {
            throw new Exception( "Veuillez saisir une adresse email s'il vous plait!" );
        }
    }

    private void validationTel( String tel ) throws Exception {
        if ( tel != null ) {
            if ( tel.trim().length() != 10 ) {
                throw new Exception( "on demande votre numero de tel r�el" );
            }
        } else {
            throw new Exception( "Veuillez saisir votre numero de Telephone" );
        }
    }
    private void validationPractice( String practice ) throws Exception {
        if ( practice=="none") {
                throw new Exception( "Veuillez saisir votre domaine m�dical!" );
        }
    }
    
    private byte[] convert(InputStream inputstream) throws IOException {
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		int nRead;
		byte[] data = new byte[16384];

		while ((nRead = inputstream.read(data, 0, data.length)) != -1) {
		  buffer.write(data, 0, nRead);
		}

		return buffer.toByteArray();
    }
    
    
}