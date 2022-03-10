<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${clinique.name}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/CliniqueDash/dashboard.css"/>">

    <!-- LOGO -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/inc/images/pageLogo.png" />" />
      
        <style>
            .popup_section1 {
                filter:blur(8px);
                pointer-events:none;
                user-select:none;
            }
            
            #popup{
                position:fixed;
                top:40%;
                left:50%;
                transform:translate(-50%,-50%);
                width:700px;
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
                padding: 0.5rem 0.5rem 0.5rem 0.5rem;
            }

            #popup .custom_select select{
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                outline: none;
                width: 100%;
                height: 100%;
                border: 0px;
                padding: 8px 10px;
                font-size: 15px;
                border: 1px solid #d5dbd9;
                border-radius: 3px;
            }

            .doctor_email_input {
                width: 200px;
            }

            #infosDocByEmail {
                display: none;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .center {
                display: block;
                margin-left: auto;
                margin-right: auto;
            }

        </style>
</head>

<body>
    
    <input type="checkbox" id="nav-toggle">
    <div class="sidebar">
        <div class="sidebar-brand">
            <img src="<c:url value="/inc/images/whiteEHealthLogo.png"></c:url>" width="250px" alt="">
        </div>
        <div class="sidebar-menu">
            <ul>

                <li>
                    <a id="dashboard" class="buttons active " onClick="handleClick(event, 'DashboardSection')"  style="cursor: pointer;">
                        
                        <span class="las la-igloo"></span>
                         <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a id="docteur" class="buttons" onClick="handleClick(event, 'doctorsDash')"  style="cursor: pointer;">
                        
                        <span class="las la-users"></span>
                          <span>Docteurs</span>
                    </a>
                </li>
                <li>
                    <a id="commentaire" class="buttons" onClick="handleClick(event, 'commentsDash')" style="cursor: pointer;">
                        <span class="las la-star"></span>
                         <span>Commentaires</span>
                    </a>
                </li>
               
                <li>
                    <a id="compte" class="buttons" onClick="handleClick(event, 'InfoClinique')" style="cursor: pointer;">
                        <span class="las la-user-circle"></span>
                         <span>Compte</span>
                    </a>
                </li>
                
                <li>
                    <a id="authBtn" class="buttons" onClick="handleClick(event, 'auth')" style="cursor: pointer;">
                        <span class="las la-key"></span>
                         <span>Authentification</span>
                    </a>
                </li>

                <br><br>
                <br><br>
                <li>
                    <a href="<c:url value="Deconnexion"></c:url>" class="buttons" style="cursor: pointer;">
                        <span class="las la-door-open"></span>
                         <span>Déconnexion</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>

    <div class="main-content">
        <header>
            <div class="header-title">
                <h2>
                    <label for="nav-toggle">
                        <span id="burger" class="las la-bars"></span>
                    </label>
                    Dashboard
                </h2>
            </div>

            <div class="user-wrapper">
                <i class="far fa-hospital fa-3x" style="color:#27aaf0; margin-right:1rem;"></i>
                <div class="user-wrapper-info">
                    <h4>${clinique.name}</h4>
                    <small style="color:black;">Clinique</small>
                </div>
            </div>
        </header>

        <main class="dashboard slideBar_main" id="DashboardSection" >
            <div class="cards">
            	<div class="card-single">
                  <div>
                      <h1>${nbrVisiters }</h1>
                      <span>Visiteurs</span>
                  </div>
                  <div class="dashboard_icon">
                      <span class="las la-users"></span>
                  </div>
                </div>
                 
                <div class="card-single">
                    <div>
                        <h1>${nbrDoctors}</h1>
                        <span>Doctors</span>
                    </div>
                    <div class="dashboard_icon">
                        <span class="las la-user-nurse"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>${nbrComments}</h1>
                        <span>Commentaires</span>
                    </div>
                    <div class="dashboard_icon">
                        <span class="las la-comment"></span>
                    </div>
                </div>
                <div class="card-single">
                    <div>
                        <h1>${nbrRating}</h1>
                        <span>Rating</span>
                    </div>
                    <div class="dashboard_icon">
                        <span class="las la-star"></span>
                    </div>
                </div>
            </div>
    
            <div class="recent-grid">
                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>Commantaires :</h3>
                            <button onclick="seeAll('commentaire', 'commentsDash')">Voire Tous <span class="las la-arrow-right"></span></button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <c:if test="${comments.isEmpty() || comments == null}">
                                    <img src="<c:url value="/inc/images/noCommentPic.png"></c:url>" class="center" width="200px">
                                    <h2 style="text-align: center;">Pas de commentaires !</h2>
                                </c:if>

                                <c:if test="${comments != null}">
                                    <table width="100%">
                                        <thead>
                                            <tr>
                                                <td>Utilisateur</td>
                                                <td>Commentaire</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <c:forEach var="entry" items="${comments}">
                                                <tr>
                                                    <td>${entry.getUser().getFirstname()} ${entry.getUser().getLastname()}</td>                                               
                                                    <td>
                                                        ${entry.commentaire}
                                                    </td>
                                                </tr>
                                            </c:forEach>   
            
                                        </tbody>
                                    </table>
                                </c:if>
                                
                            </div>
                        </div>
                    </div>
                </div>
    
                <div class="customers">
                    <div class="card">
                        <div class="card-header">
                            <h3>Vos Docteurs :</h3>
                            <button onclick="seeAll('docteur', 'doctorsDash')">Voire Tous <span class="las la-arrow-right"></span></button>
                        </div>
                        <div class="card-body">
                            <c:if test="${doctors.isEmpty()}">
                                <img src="<c:url value="/inc/images/noDoctorPic.png"></c:url>" class="center" width="100px"></td>
                                <h3 style="text-align: center;">Aucun docteur !</h3>
                            </c:if>

                            <c:if test="${!doctors.isEmpty()}">
                                <c:forEach var="entry" items="${doctors}">
                                    <div class="customer">
                                        <div class="info">
                                            <img src="data:image/png;base64,${docteurImpl.returnImage(entry)}" width="40px" height="40px" alt="">
                                            <div>
                                                <h4>${entry.getFirstname()} ${entry.getLastname()}</h4>
                                                <small>Docteur</small>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
    
        <main class="commentaire hide slideBar_main" id="commentsDash" >
            <div class="projects">
                <div class="card">
                    <div class="card-header">
                        <h3>Commantaires :</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <c:if test="${comments.isEmpty() || comments == null}">
                                <img src="<c:url value="/inc/images/noCommentPic.png"></c:url>" class="center" width="250px"></td>
                                <h2 style="text-align: center;">Pas de commentaires !</h2>
                            </c:if>
                            

                            <c:if test="${comments != null}">
                                <table width="100%" >
                                    <thead>
                                        <tr>
                                            <td>Utilisateur</td>
                                            <td>Commentaire</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="entry" items="${comments}">
                                            <tr>
                                                <td>${entry.getUser().getFirstname()} ${entry.getUser().getLastname()}</td>                                               
                                                <td>
                                                    ${entry.commentaire}
                                                </td>
                                                <td>
                                                	<form method="get" action="<c:url value="GestionComment"></c:url>">
                                                		
                                                		<input type="text" name="delete_comment_clinique" value="${entry.idCommentaire }">
                                                		<input type="text" value="${ entry.getClinique().getCin() }" name="clinic" />
                                                		<button class="styleIcon" type="submit" ><span class="fas fa-trash"></span></button>
                                                	</form>
                                                </td>
                                            </tr>
                                        </c:forEach>
        
                                    </tbody>
                                </table>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    
        <main id="doctorsDash" class=" docteur hide slideBar_main" >
            <div class="projects">
                <div class="card">
                    <div class="card-header">
                        <h3>Docteurs :</h3>
                        <div>
                            <button class="ajouterDocteur" style="background-color:#27AAF0;border:#27AAF0;cursor:pointer;">Ajouter  <span class="fas fa-plus"></span></button>
                        </div>
                       
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <c:if test="${doctors.isEmpty()}">
                                <img src="<c:url value="/inc/images/noDoctorPic.png"></c:url>" class="center" width="250px"></td>
                                <h2 style="text-align: center;">Aucun docteur !</h2>
                            </c:if>

                            <c:if test="${!doctors.isEmpty()}">
                                <table width="100%">
                                    <thead>
                                        <tr>
                                            <td>Image</td>
                                            <td>Docteur</td>
                                            <td>Spécialité</td>
                                            <td>Consulter</td>
                                            <td>Suprimer</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="entry" items="${doctors}">
                                            <tr>
                                                <td><img src="data:image/png;base64,${docteurImpl.returnImage(entry)}" style="border-radius:40%" width="100px"></td>
                                                <td>${entry.getFirstname()} ${entry.getLastname()}</td>
                                                <td> ${entry.speciality} </td>
                                                <td><a class="styleIcon" style="text-decoration: none;" href="<c:url value="/doctorProfile?docteur=${ entry.cin }"></c:url>" target="_blank"><span class="fas fa-user"></span></a></td>
                                                <td>
                                                	<form method="POST" action="<c:url value="cliniqueAssociation"></c:url>">
                                                		<input type="hidden" name="idClinique" value="${ clinique.cin }">
                                                		<input type="hidden" name="docteurId" value="${ entry.cin }">
                                                		<button class="styleIcon" type="submit"><span class="fas fa-trash"></span></button>
                                                	</form>
                                                </td>
                                            </tr>
                                        </c:forEach>
        
                                    </tbody>
                                </table>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
    
            <div id="tableDoctors" style="display: none;">
                <c:forEach var="docteur" items="${ allDocteurs }">
    
                    <div class="infosTable">
    
                        <form method="POST" action="<c:url value="cliniqueAssociation"></c:url>">
                            <table>
                                <tr>
                                    <td rowspan="4"><img src="data:image/png;base64,${docteurImpl.returnImage(docteur)}" width="150px"></td>
                                    <td><label>Nom complet :</label></td> 
                                    <td><input type="text" value="${docteur.firstname} ${docteur.lastname}"></td>
                                </tr>
                                        
                                <tr>
                                    <td><label>Specialité :</label></td>
                                    <td><input type="text" value="${docteur.speciality}"></td>
                                </tr>
                                        
                                <tr>
                                    <td><label>Email :</label></td>
                                    <td><input type="text" class="docteurEmail" value="${docteur.email}"></td>
                                </tr>
                    
                                <tr>
                                    <td><label>Telephone :</label></td>
                                    <td><input type="text" value="${docteur.tel}"></td>
                                </tr>
    
                                <tr>
                                    <td><input type="text" name="id" value="${docteur.cin}" hidden><input type="text" name="idClinique" value="${clinique.cin}" hidden></td>
                                    <td><input type="submit" class="signup" value="Ajouter"></td>
                                    <td><input type="button" class="signup closepopup" value="Annuler"></input></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </main>

        <div id="popup">
            <span class="closepopup" style="position: absolute; top :2px ; margin-left: 90%;cursor:pointer;"><i class="fas fa-times"></i></span>
            <h2>Insérer l'email du docteur :</h2> 
            <div class="popup-buttons">
                <div class="custom_select">
                    <input type="search" id="doctor_email_input">
                    <label onclick="handle_doctor_email_button()" class="signup">Chercher</label>
                </div>
            </div>
            <div id='infosDocByEmail' >
                
            </div>
            
        </div>

        <main id="InfoClinique" class="compte hide slideBar_main" >
            <form method="POST" action="<c:url value="InformationClinique"></c:url>">
                <div class="wrapper" >
                    <div class="title">
                      Modifier vos Information :
                    </div>
                    <div class="form">
                       <div class="inputfield">
                          <label>Nom de la Clinique :</label>
                          <input type="text" name="nom" value="${clinique.name}" class="input">
                          <input type="hidden" name="id" value="${clinique.cin}" class="input">
                       </div>  
                       <div class="inputfield">
                        <label>Email Address</label>
                        <input type="text" name="email" value="${clinique.email}" class="input">
                     </div> 
                        <div class="inputfield">
                          <label>Adresse :</label>
                          <input type="text" name="adresse" value="${clinique.adresse}" class="input">
                     </div>  
                     <div class="inputfield">
                       		<label>Ville :</label>
                        	<input type="text" name="ville" value="${clinique.ville}" class="input">
                       </div>
                      <div class="inputfield"> 
                          <label>Téléphone :</label>
                          <input type="text" name="tel" value="${clinique.tel}" class="input">
                          
                      </div>   
                      <div class="inputfield">
                          <label>Description :</label>
                          <textarea class="input" name="desc" cols="30" rows="4">${clinique.description}</textarea>
                       </div> 
                       <div class="inputfield">
                       <label>Téléphone D'urgence :</label>
                        <input type="text" name="urgence" value="${clinique.emergency_tel}" class="input">
                        
                       </div> 
                        <div class="inputfield">
                            <label>Spécialité :</label>
                            <div class="custom_select">
                                <select name="speciality">
                                    <c:forEach var="specia" items="${Instances.specialities()}">
                                    
                                        <option value="${specia}" ${clinique.speciality.equals(specia) ? 'selected' : '' } }>${specia}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div> 
                        <div class="inputfield">
                       		<label>ID de Localisation:</label>
                        	<input type="text" name="id_localisation" value="${clinique.id}" class="input" style="margin-left: 37px;">
                            <span id="Trouverplace_id" onclick="Trouverplace_id()" >Trouver id</span>
                            <span id="findplace_id" onclick="hundleComment()">Comment?</span>
                        </div>
                       
                        <div class="inputfield" id="findPlace" style="display: none;">
                           <img src="<c:url value="/inc/images/findIdCliniquePic.png"></c:url>" class="center" width="500px">
                        </div>
                       
                        <div class="inputfield">
                            <input type="submit" value="Enregistrer" class="btn">
                        </div>
                    </div> 
                </div>
            </form>
        </main>
        
        <main id="auth" class="compte hide slideBar_main" >
            <form method="POST" action="<c:url value="Euthentification"></c:url>">
                <div class="wrapper" >
                    <div class="title">
                      Modifier votre Informations d'authentification :
                    </div>
                    <div class="form">
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 50%;"><label>Ancien mot de passe :</label></td>
                                <td>
                                    <input style="width: 100%;" type="password" name="oldMdp" class="input"><input type="hidden" name="id" value="${clinique.cin}" class="input">
                                </td>
                            </tr>
                            
                            <tr>
                                <td style="width: 50%;"><label>Nouveau mot de passe :</label></td>
                                <td><input style="width: 100%;" type="password" name="newMdp" class="input"></td>
                            </tr>
                            
                            <tr>
                                <td style="width: 50%;"><label>Confirmation de nouveau mot de passe :</label></td>
                                <td><input style="width: 100%;" type="password" name="confirmationNewMdp" class="input"></td>
                            </tr>

                        </table>
                       
                        <div class="inputfield">
                            <input type="submit" value="Enregistrer" class="btn">
                        </div>
                    </div> 
                </div>
            </form>
        </main>

    </div>

    <script>
        var btn = document.getElementsByClassName('buttons');
        var mains = document.getElementsByTagName('main');
        var popupBtn = document.querySelector(".ajouterDocteur");
        var popup = document.querySelector("#popup");
        var blured = document.querySelector("#doctorsDash");
        var burgerBtn = document.querySelector("#burger");
        var closepop = document.querySelectorAll(".closepopup");

        popupBtn.addEventListener("click",function(){
            popup.classList.toggle("active");
            blured.classList.toggle("popup_section1");
            burgerBtn.click();
        });

        function hundleComment() {
            var image = document.getElementById("findPlace");
            if(image.style.display == "none"){
                image.style.display = "block";
            }else {
                image.style.display = "none";
            }
        }

        for (var i=0 ,len=closepop.length; i<len ;i++){
            closepop[i].addEventListener("click",()=>{
                if(blured.classList.contains("popup_section1")){
                blured.classList.remove("popup_section1");
                popup.classList.remove("active");
                burgerBtn.click();
                }
            });
        }
    
        function handle_doctor_email_button() {
            var email = document.getElementById("doctor_email_input").value;
            var exist = false;
            var index;
            var infosTables = document.getElementsByClassName('infosTable');
            for(var i = 0; i < infosTables.length; i++) {
                if(email == infosTables[i].getElementsByClassName('docteurEmail')[0].value){
                    index = i;
                    exist = true;
                    break;
                }
            }

            if(exist){
                document.getElementById('infosDocByEmail').innerHTML = infosTables[index].innerHTML;
            }else {
                document.getElementById('infosDocByEmail').innerHTML = "<h4>Cet email n'existe pas !!</h4>"
            }
            document.getElementById('infosDocByEmail').style.display='block';
        }
       
        var btn = document.getElementsByClassName('buttons');
        function handleClick(event, param_div_id){
            var j;
            if (event.target.classList.contains('buttons')) {
                for(var i=0; i<btn.length; i++){
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(btn[i] === event.target){
                        j = i;
                    }
                }
                
            } else {
                for(var i=0; i<btn.length; i++){
                    
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(event.target === btn[i].getElementsByTagName("span")[0] || event.target === btn[i].getElementsByTagName("span")[1]){
                        j = i;
                    }
                }
            }

            btn[j].classList.add('active');
            slideBar_mains = document.getElementsByClassName('slideBar_main');
            for(var i=0; i<slideBar_mains.length; i++){
                if(!slideBar_mains[i].classList.contains('hide')){
                    slideBar_mains[i].classList.add('hide');
                }
            }
            document.getElementById(param_div_id).classList.remove('hide');
        }

        function seeAll(btnId, param_div_id) {
            var j;
            var seeAllBtn = document.getElementById(btnId);
            if (seeAllBtn.classList.contains('buttons')) {
                for(var i=0; i<btn.length; i++){
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(btn[i] === seeAllBtn){
                        j = i;
                    }
                }
                
            } else {
                for(var i=0; i<btn.length; i++){
                    
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(seeAllBtn === btn[i].getElementsByTagName("span")[0] || event.target === btn[i].getElementsByTagName("span")[1]){
                        j = i;
                    }
                }
            }

            btn[j].classList.add('active');
            slideBar_mains = document.getElementsByClassName('slideBar_main');
            for(var i=0; i<slideBar_mains.length; i++){
                if(!slideBar_mains[i].classList.contains('hide')){
                    slideBar_mains[i].classList.add('hide');
                }
            }
            document.getElementById(param_div_id).classList.remove('hide');
        }
        
        function handleDeleteClick(){
        	document.getElementById('delete_comment_btn').click();
        }

        function Trouverplace_id(){
            window.open("https://developers-dot-devsite-v2-prod.appspot.com/maps/documentation/utils/geocoder");
        }

    </script>
</body>
</html>