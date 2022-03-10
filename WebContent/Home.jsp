<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-HEALTH</title>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdn.rawgit.com/mfd/09b70eb47474836f25a21660282ce0fd/raw/e06a670afcb2b861ed2ac4a1ef752d062ef6b46b/Gilroy.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="<c:url value="/FrontENd/Styling/home.css" />">
    <link rel="stylesheet" href="<c:url value="/FrontEnd/Styling/index.css" />">
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/searchClinique/pageLogo.png"></c:url>" />

    <!-- Google API-->
    <script defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcybDNa2i9CePsLK9l7rAhcAafXMGALcY&libraries=places">
    </script>
      
      <style>
      .popup_section1#blur.active, #blurimg.active{
        filter:blur(20px);
        pointer-events:none;
        user-select:none;
        }
        
        #popup{
        position:fixed;
        top:40%;
        left:50%;
        transform:translate(-50%,-50%);
        width:650px;
        padding:50px;
        box-shadow:0 5px 30px rgba(0,0,0,.30);
        background:#fff;
        visibility:hidden;
        opacity:0;
        transition:0.5s;
        
        }
        
        #popup.active{
        top:50%;
        visibility:visible;
        opacity:1;
        transition:0.5s;
        }
        #popup > h2{
        text-align:center;
        margin-bottom:40px;
        }
        .popup-buttons{
        display:flex;
        justify-content:space-around;
        }
        .signup{
	    height: 40px;
	    width: 100px;
	    border-radius: 5px;
	    border: none;
	    font-family:'Gilroy';
	    font-weight: 500;
	    font-size: 16px;
	    filter: drop-shadow(3px 3px 3px #BCDAE8);
	    outline: none;
	    cursor: pointer;
	    background-color: #27AAF0;
	    opacity: 0.7;
	    color: #EDF8FF ;
        }

      
      </style>   
        
</head>
<body onload="initialize()">
    <header>
        <div class="header-links">
            <div class="logo-container">
                <h3 ><a  class="logo"><img src="<c:url value="/inc/images/EHealthLogo.png"></c:url>" width="250px"></a></h3>
            </div>
            <nav>
                <ul class="nav-links">
                    <li><a  href="#section-1" class="nav-link">Acceuil</a></li>
                    <li><a href="#section-2" class="nav-link" >Medecin</a></li>
                    <li><a href="#section-3" class="nav-link" >Hopital</a></li>
                    <li><a href="#section-4" class="nav-link" >Clinique</a></li>
                    <li><a href="#section-5" class="nav-link" >Pharmacie</a></li>
                    <div >
                        <li><a href="#" class="tmp"><i class="fas fa-user"></i> Login</a></li>
                        <li><a href="#" class="tmp"><i class="fas fa-sign-in-alt"></i> Sign up</a></li>
                    </div>
                </ul>
            </nav>
            <c:if test="${ sessionScope.visiter == null && sessionScope.admin == null && sessionScope.clinique == null && sessionScope.docteur == null  }">
            	
            	<div class="account">
	               	<a id="conBtn" href="<c:url value="/signIn" />"><button  class="sign-in">Connexion</button></a>
	                <button class="sign-up" onclick="toggle()" id="toggle" >Inscription</button>
            	</div>
            </c:if>
            <c:if test="${ sessionScope.visiter != null && sessionScope.admin == null && sessionScope.clinique == null && sessionScope.docteur == null }">
            	<div class="account">
            	
            		<form method="get" action="<c:url value="Deconnexion" />">
            			<button type="submit" class="sign-up" style="padding:0px 5px" >Log Out</button>
            		</form>
	               	<form method="get" action="<c:url value="UserProfile" />">
            			<button type="submit" class="sign-up" style="padding:0px 5px" >Profile</button>
            		</form>
            	</div>
            </c:if>
            
            <div class="burger">
                <div class="line1"></div>
                <div class="line2"></div>
                <div class="line3"></div>
            </div>
        </div>
       
    </header>
    <section id="section-1" class="section" onClick="untoggle();">
        <div class="description-1 popup_section1" id="blur" >
            <h1 class="title">
                Vous cherchez <span class="animate"></span>
            </h1>
            <p class="text-description">
                Grâce à notre site internet vous pouvez tout faire y compris la recherche d'un cabinet médical,
                d'une clinique, d'une pharmacie de garde, d'un hôpital selon VOS critères de choix 
            </p> 
            <div class="buttons">
                <button onclick="handleClickConnexion()" class="sign-in cta">
                    Connectez vous
                </button>
                <button onclick="toggle()" class="sign-up cta">
                    rejoignez nous ! 
                </button>
            </div>
        </div >
        <div id="blurimg"><img class="img-1" src="<c:url value="/FrontEnd/Includes/images/image-1.svg" />" alt="e-health"></div>
    </section>
    <!-- La pop up  -->
    <div id="popup">
       <h2>Vous souhaitez vous inscrire en tant que :</h2>
       <div class="popup-buttons">
            <a href="<c:url value="/doctorForm" />"><button class="signup"  >Médecin</button></a>
            <a href="<c:url value="/clinicForm" />"><button  class="signup"  >Clinique</button></a>
            <a href="<c:url value="/visiterForm" />"><button class="signup"  >Utilisateur</button></a></div>
        </div>
     <hr>
    <!-- -----------La deuxieme section --------------- -->
    <!-- Trouver Un Medecin -->
    <section id="section-2" class="section" >
        <img class="img-2" src="<c:url value="/FrontEnd/Includes/images/image-2.svg" />" alt="Medecin" data-aos="fade-right">
        <div class="description-2" data-aos="fade-up">
            <h1 class="title">
                Trouver Un medecin
            </h1>
            <p class="text-description">
               Vous êtes à la recherche d'une recommandation pour un medecin ?</br></br>
                Trouver un medecin près de chez vous et prenez votre rendez-vous !
            </p> 
          <form method="get" action="<c:url value="searchDoctor"></c:url>" >
              <input type="text" placeholder="Entrer votre localisation" class="localisation" name="localisation" id="" autocomplete="off" required />
              <input type="submit" class="submit" value="Chercher . . .">
          </form>
        
        </div >
    </section>
    <!-- !Trouver Un Medecin -->

    <!-- Trouver Un Hopital -->
    <section id="section-3" class="section" >
        <div class="description-3" data-aos="fade-right">
            <h1 class="title">
                Trouver Un Hopital
            </h1>
            <p class="text-description">
                Vous cherchez à être hospitalisé dans le meilleur hopital près de chez vous ? <br/><br/>
                saisissez votre localisation et nous nous occuperons du reste !
            </p> 

            <form method="get" action="<c:url value="/searchHospital"></c:url>" >
                <input type="text" placeholder="Entrer votre localisation" class="localisation" name="adresse" id="adresse" autocomplete="off" required />
                <input type="submit" class="submit" value="Chercher . . .">
            </form>
        </div >
        <img class="img-3" src="<c:url value="/FrontEnd/Includes/images/image-3.svg" />" alt="Clinique" data-aos="fade-up">
    </section>
    <!-- !Trouver Un Hopital -->

    <!-- Trouver Une Clinique -->
    <section id="section-4" class="section" >
        <img class="img-4" src="<c:url value="/FrontEnd/Includes/images/image-4.svg" />" alt="Laboratoire" data-aos="fade-right">
        <div class="description-4" data-aos="fade-up">
            <h1 class="title">
                Trouver Une Clinique 
            </h1>
            <p class="text-description">
                Communiquez avec la meilleure clinique près de chez vous et reserver un rendez-vous ! 
            </p> 

            <form method="get" action="<c:url value="/searchClinique"></c:url>">
                <input type="text" placeholder="Entrer votre localisation" class="localisation" name="adresse" id="adresse" autocomplete="off" required />
                <input type="submit" class="submit" value="Chercher . . .">
            </form>
        
        </div >
    </section> 
    <!-- !Trouver Ue Clinique -->

    <!-- Trouver Un Laboratoire -->
    <section id="section-5" class="section" >
        <div class="description-1" data-aos="fade-right">
            <h1 class="title">
                Trouver Un Pharmacie
            </h1>
            <p class="text-description">
                Vous voulez effetuer des analyses et obtenir les résultats dans un delai court ?<br/><br/>
                Saisissez votre adresse ci-dessous 
            </p> 

            <form action="<c:url value="SearchPharmacie" />" method="post">
                <input type="text" placeholder="Entrer votre localisation" class="localisation" name="ville" id="ville" autocomplete="off" required />
                <input type="submit" class="submit" value="Chercher . . .">
            </form>
        
        </div >
        <img class="img-1" src="<c:url value="/FrontEnd/Includes/images/image-5.svg" />" alt="e-health" data-aos="fade-up">
    </section>
    <!-- Trouver Un Laboratoire -->
    
    <c:import url="/FrontEnd/footer.jsp"></c:import>
       
    <script type="text/javascript">
	    function toggle(){
	    	var blur=document.getElementById('blur');
	    	blur.classList.toggle('active');
	        var blurimg=document.getElementById('blurimg');
	        blurimg.classList.toggle('active');
	    	var popup=document.getElementById('popup');
	    	popup.classList.toggle('active');
	    }
	    //document.getElementById("toggle").addEventListener("click", toggle);
        
	    function untoggle(){
	    	var blur=document.getElementById('blur');
	    	blur.classList.toggle("active",false);
	        var blurimg=document.getElementById('blurimg');
	        blurimg.classList.toggle("active",false);
	    	var popup=document.getElementById('popup');
	    	popup.classList.toggle("active",false);
	    }
	    
	    function handleClickConnexion(){
	    	document.getElementById('conBtn').click();
	    }

        var autocomplete;
        function initialize() {
            var localisations = document.getElementsByClassName("localisation");
            for(var i = 0; i < localisations.length; i++){
                autocomplete = new google.maps.places.Autocomplete(
                (localisations[i]),
                { types: ['geocode'] });
                google.maps.event.addListener(autocomplete, 'place_changed', function() {
                });
            }
            
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/typed.js@2.0.11"></script>
    <script src="<c:url value="/FrontEnd/JavaScript/home.js" />"></script>

</body>
</html>