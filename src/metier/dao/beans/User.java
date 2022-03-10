package metier.dao.beans;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Inheritance( strategy = InheritanceType.JOINED )
public class User implements Serializable {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    private Long   cin;
    private String firstname;
    private String lastname;
    private String email;
    private String password;
    private String tel;

    @ManyToOne
    @JoinColumn( name = "idRole", referencedColumnName = "idRole" )
    private Role   role;

    public User() {
        super();
    }

    public Role getRole() {
        return role;
    }

    public void setRole( Role role ) {
        this.role = role;
    }

    public Long getCin() {
        return cin;
    }

    public void setCin( Long cin ) {
        this.cin = cin;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname( String firstname ) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname( String lastname ) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail( String email ) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword( String password ) {
        this.password = password;
    }
    
    public String getTel() {
		return tel;
	}
    
    public void setTel(String tel) {
		this.tel = tel;
	}

}
