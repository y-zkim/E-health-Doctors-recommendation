<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${docteur.firstname} ${docteur.lastname}</title>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/DoctorDashboard/assets/css/dashboard.css"></c:url>">

	<!-- LOGO -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/inc/images/pageLogo.png" />" />
    
    <!-- Google Maps API -->
    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcybDNa2i9CePsLK9l7rAhcAafXMGALcY&libraries=places&callback=initMap"> </script>
</head>
<body>
    
    <input type="checkbox" id="nav-toggle">
    <div class="sidebar">
        <div class="sidebar-brand">
            <img src="<c:url value="/inc/images/whiteEHealthLogo.png"></c:url>" style="width: 250px;" alt="">
        </div>
        <div class="sidebar-menu">
            <ul>
                <li>
                    <a href="#"  class="buttons active" onClick="handleClick(event)">
                        <span class="las la-igloo"></span>
                        <span class="sideebarText">Tableau de bord</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="buttons" onClick="handleClick(event)">
                        <span class="las la-users"></span>
                        <span class="sideebarText">Docteur</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="buttons" onClick="handleClick(event)">
                        <span class="las la-clipboard-list"></span>
                        <span class="sideebarText">Cabinet</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="buttons" onClick="handleClick(event)">
                        <span class="las la-star"></span>
                        <span class="sideebarText">Evaluation</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="buttons" onClick="handleClick(event)">
                        
                        <span class="las la-hospital"></span>
                        <span class="sideebarText">Associations</span>
                    </a>
                </li>
                
                <li>
                    <a href="#" class="buttons" onClick="handleClick(event)">
                        
                        <span class="las la-key"></span>
                        <span class="sideebarText">Authentification</span>
                    </a>
                </li>

                <li style="height: 50px;">
                    
                </li>

                <li>
                    <a class="deconnexion" href="<c:url value="/Deconnexion"></c:url>">
                        
                        <span class="las la-door-open"></span>
                        <span class="sideebarText">Déconnexion</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-content" >
        <header>
            <div class="header-title">
                <h2>
                    <label onclick="toggleBtnClick()" for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>
                    <span id="page-name">Tableau de bord</span>
                </h2>
            </div>

            <div class="user-wrapper">
                <img src="data:image/png;base64,${image}" width="40px" height="40px" alt="">
                <div class="user-wrapper-info">
                    <h4>${docteur.firstname} ${docteur.lastname}</h4>
                    <small>Medecin</small>
                </div>
            </div>
        </header>

        <main>
            <div class="slidebar-menu"  id="dashboard">
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
                            <h1>${numberOfRating}</h1>
                            <span>Votes</span>
                        </div>
                        <div class="dashboard_icon">
                            <span class="las la-star"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${nbrsOfComments}</h1>
                            <span>Commentaires</span>
                        </div>
                        <div class="dashboard_icon">
                            <span class="las la-comment"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${nbrAssociation}</h1>
                            <span>Associations</span>
                        </div>
                        <div class="dashboard_icon">
                            <span class="las la-hospital"></span>
                        </div>
                    </div>
                </div>
    
                <div class="recent-grid">
                    <div class="comments">
                        <div class="demmande_card">
                            <div class="card-header">
                                <h3>Commentaires</h3>
                                <button onclick="voireComments()">Voire tous<span class="las la-arrow-right"></span></button>
                            </div>
                            <div class="demmande-card-body">
                                <div class="table-responsive">

                                    <c:if test="${commentaires == null || commentaires.isEmpty()}">
                                        <img src="<c:url value="/inc/images/noCommentPic.png"></c:url>" class="center" width="200px"></td>
                                        <h2 style="text-align: center;">Pas de commentaires !</h2>
                                    </c:if>

                                    <c:if test="${commentaires != null}">
                                        <table width="100%">
                                            <thead>
                                                <tr>
                                                    <td>Username</td>
                                                    <td>Vote</td>
                                                    <td>Commentaire</td>
                                                </tr>
                                            </thead>
                                            <tbody>
        
                                                <!-- Selement 5 -->
                                                <c:forEach var="commentaire" items="${commentaires}" begin="1" end="5">
                                                    <tr>
                                                        <td>${commentaire.getUser().getFirstname()} ${commentaire.getUser().getLastname()}</td>
                                                        <td style="width: 150px;">
                                                            <div class="text-warnning">
                                                                <span><i class="las la-lg la-star"></i></span>
                                                                <span><i class="las la-lg la-star"></i></span>
                                                                <span><i class="las la-lg la-star"></i></span>
                                                                <span><i class="lar la-lg la-star"></i></span>
                                                                <span><i class="lar la-lg la-star"></i></span>
                                                            </div>
                                                        </td>
                                                            
                                                        <td class="">
                                                            <span class="">${commentaire.getCommentaire()}</span>
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
    
                    <div class="association">
                        <div class="demmande_card">
                            <div class="card-header">
                                <h3>Associations</h3>
                                <button onclick="voireAssociations()">Voire tous<span class="las la-arrow-right"></span></button>
                            </div>
                            <div class="demmande-card-body">
                                <div class="table-responsive">
                                    <c:if test="${ ((hopitaux == null) && (cliniques == null)) || ((hopitaux.isEmpty()) && (cliniques.isEmpty())) }">
                                        <img src="<c:url value="/inc/images/noClinicPic.png"></c:url>" class="center" width="100px"></td>
                                        <h2 style="text-align: center;">Aucune association !</h2>
                                    </c:if>

                                    <c:if test="${ !hopitaux.isEmpty() || !cliniques.isEmpty() }">
                                        <table width="100%">
                                            <c:if test="${ !hopitaux.isEmpty() }">
                                                <thead>
                                                    <tr>
                                                        <td>Hopiteaux</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Selement 2 -->
                                                    <c:forEach var="hopital" items="${hopitaux}" begin="1" end="2">
                                                        <tr>
                                                            <td>${hopital.name}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </c:if>
                                            
                                            <c:if test="${ !cliniques.isEmpty() }">
                                                <thead>
                                                    <tr>
                                                        <td>Cliniques</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <!-- Selement 2 -->
                                                    <c:forEach var="clinique" items="${cliniques}" begin="1" end="2">
                                                        <tr>
                                                            <td>${clinique.name}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </c:if>
        
                                        </table>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="slidebar-menu" id="Doctor" style="display: none;">

                    <!-- Information Personnel section -->
                    <div class="recent-grid">
                        <div class="InfoPerso">
                            <div class="demmande_card">
                                <div class="card-header">
                                    <h3>Informations personneles</h3>
                                </div>
                            <!-- Start Form Personnel -->
                            <form method="POST" action="<c:url value="InformationPerso"></c:url>">
                                <div class="demmande_card">
                                    <div class="table-responsive">
                                        <table>
                                            <tr>
                                                <input type="hidden" value="${docteur.cin}" name="id">
                                                <td><label for="">Nom :</label></td>
                                                <td><input name="Nom" value="${docteur.lastname}" type="text" class="infoInput" disabled><br></td>
                                            </tr>
    
                                            <tr>
                                                <td><label for="">Prenom  :</label></td>
                                                <td><input name="Prenom" value="${docteur.firstname}" type="text" class="infoInput" disabled><br></td>
                                            </tr>

                                            <!-- <tr>
                                                <td><label for="">Date de naissance :</label></td>
                                                <td><input name="Date_naissance" value="" type="date" value="2018-07-22" class="infoInput" disabled><br></td>
                                            </tr> -->

                                            <tr>
                                                <td><label for="">Sexe :</label></td>
                                                <td>
                                                	<c:set var="h" value="Homme"></c:set>
                                                	<c:set var="f" value="Femme"></c:set>
                                                    <select name="sexe" class="select-css infoInput" disabled>
                                                    	<option value="${h }" <c:if test="${docteur.gender == h }"><c:out value="selected"/></c:if> >${h }</option>
                                                    	<option value="${f }" <c:if test="${docteur.gender == f }"><c:out value="selected"/></c:if>>${f }</option>
                                                        
                                                    </select>
                                                </td>
                                            </tr>
    
                                            <tr>
                                                <td><label for="">Adresse :</label></td>
                                                <td><input name="Adresse" value="${docteur.adresse}" type="text" class="infoInput" disabled><br></td>
                                            </tr>
    
                                            <tr>
                                                <td><label for="">Telephone :</label></td>
                                                <td><input name="Telephone" value="${docteur.tel}" type="text" class="infoInput" disabled><br></td>
                                            </tr>
    
                                            <tr>
                                                <td><label for="">Ville :</label></td>
                                                <td><input name="Ville" value="${docteur.ville}" type="text" class="infoInput" disabled><br></td>
                                            </tr>
    
                                            <tr>
                                                <td rowspan="2"><label for="">Langues :</label></td>
                                                <td>
	                                                <label style="margin-right: 5px;" for="English"><input style="margin-right: 2px;" name="langue" value="English" id="English" type="checkbox" class="infoInput" <c:forEach var="langue" items="${docteur.langues}"><c:if test="${ langue.langue == 'English' }"><c:out value='checked'></c:out> </c:if></c:forEach> disabled>English</label>
	                                                <label style="margin-right: 5px;" for="Spanish"><input style="margin-right: 2px;" name="langue" value="Spanish" id="Spanish" type="checkbox" class="infoInput" <c:forEach var="langue" items="${docteur.langues}"><c:if test="${ langue.langue == 'Spanish' }"><c:out value='checked'></c:out></c:if></c:forEach> disabled>Spanish</label>
	                                                <label style="margin-right: 5px;" for="Chinese"><input style="margin-right: 2px;" name="langue" value="Chinese" id="Chinese" type="checkbox" class="infoInput" <c:forEach var="langue" items="${docteur.langues}"><c:if test="${ langue.langue == 'Chinese' }"><c:out value='checked'></c:out></c:if></c:forEach> disabled>Chinese</label>
                                                
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <label style="margin-right: 5px;" for="Frensh"><input style="margin-right: 2px;" name="langue" value="Frensh" id="Frensh" type="checkbox" class="infoInput" <c:forEach var="langue" items="${docteur.langues}"><c:if test="${ langue.langue == 'Frensh' }"><c:out value='checked'></c:out> </c:if></c:forEach> disabled>Frensh</label>
                                                    <label style="margin-right: 5px;" for="Arabic"><input style="margin-right: 2px;" name="langue" value="Arabic" id="Arabic" type="checkbox" class="infoInput" <c:forEach var="langue" items="${docteur.langues}"><c:if test="${ langue.langue == 'Arabic' }"><c:out value='checked'></c:out> </c:if></c:forEach> disabled>Arabic</label>
                                                </td>
                                            </tr>
    
                                            <tr>
                                                <td><label for="">Spécialité :</label></td>
                                                <td>
                                                	<select name="speciality" class="select-css infoInput" disabled>
								                    	<c:forEach var="specia" items="${Instances.specialities()}">
								                    		<option value="${specia}" ${ docteur.speciality.equals(specia) ? 'selected' : '' } }>${specia}</option>
								                    	</c:forEach>
						                   			 </select>
                                                    
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td><label for="">Description :</label></td>
                                                <td><textarea name="description" id="description" cols="60" rows="5" class="infoInput" disabled>${docteur.description}</textarea></td>
                                            </tr>
    
                                            <tr>
                                                <td><label for="">Biographie:</label></td>
                                                <td><textarea name="biographie" id="biologie"  cols="60" rows="5" class="infoInput" disabled>${docteur.biographie}</textarea></td>
                                            </tr>
                                        </table>
                                    </div>
    
                                    <div class="image-card">
                                        <label id="modifierInfoPerso" onclick="modifierInfoPerso()">Modifier</label>
                                        <input type="submit" id="enregistrerInfoPerso" value="Enregistrer" style="display: none;">
                                        <label id="annulerInfoPerso" onclick="reloadPage()" style="display: none;">Annuler</label>
                                    </div>
                                </div>
                            </form>
                            <!-- !End Form Personnel -->
                        </div>
                    </div>
                        
                        <form method="POST" action="<c:url value="ChangeImageDoctor"></c:url>" enctype="multipart/form-data">
                            <div class="imagePerso">
                                <div class="image-card">
                                    <img id="imageDoctor" src="data:image/png;base64,${image}" width="150px" alt=""><br>
                                    <c:set var="ChangeImageProfileDocteur" value="${docteur }" scope="session"></c:set>
                                    <input id="imageInput" accept="image/*" type="file" name="change_image_profile" style="display: none;" onchange="loadImage(event)">
                                    <div class="image-card">
                                        <label id="modifierImagePerso" onclick="modifierImagePerso()">Changer l'image</label>
                                        <input type="submit" id="enregistrerImagePerso" value="Enregistrer" style="display: none;">
                                        <label id="annulerImagePerso" onclick="reloadPage()" style="display: none;">Annuler</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- !Information Personnel section -->

                    <!-- Education  section -->
                    <div class="recent-grid">

                        <div class="education">
                            <div class="demmande_card">
                                <div class="card-header">
                                    <h3>Education</h3>
                                    <label onclick="ajouterEduc()">Ajouter</label>
                                </div>
                                <div class="demmande-card-body">
                                    <div class="table-responsive">
                                        <c:if test="${educations == null || educations.isEmpty()}">
                                            <img src="<c:url value="/inc/images/noEducPic.png"></c:url>" class="center" width="100px"></td>
                                            <h2 style="text-align: center;">Aucune education !</h2>
                                        </c:if>

                                        <c:if test="${educations != null}">
                                            <table style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <td>Année</td>
                                                        <td>Diplome</td>
                                                        <td>Etablissement</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="education" items="${educations}">
                                                        <tr>
                                                            <td>${education.anneeEduc}</td>
                                                            <td>${education.education}</td>
                                                            <td>${education.descEduc}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="nouvelleEducation" style="display: none;">
                            <!-- Start Education Formulaire -->
                            <form method="POST" action="<c:url value="EducationForm"></c:url>">
                                <div class="demmande_card">
                                    <div class="card-header">
                                        <h3>Nouvelle education</h3>
                                    </div>
                                    <div class="demmande-card-body">
                                        <div class="table-responsive">
                                            
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>Année</td>
                                                    <td>
                                                        <select name="anneeDiplome" id="anneeDiplome"></select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Diplome</td>
                                                    <td><input name="nomDiplome" type="text" class="infoInput"><br></td>
                                                </tr>
                                                <tr>
                                                    <td>Etablissement</td>
                                                    <td><input name="etablissementDiplome" type="text" class="infoInput"><br></td>
                                                </tr>
                                                <input name="doc" value="${docteur.cin}" type="hidden" class="infoInput">
                                            </table>
                                        </div>
                                        <div class="image-card">
                                            <input type="submit" id="enregistrerEducation" value="Enregistrer">
                                            <label id="annulerEducation" onclick="hideNewEduc()">Annuler</label>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- Send Education Formulaire -->
                        </div>

                    </div>
                    <!-- !Education  section -->

                    <!-- Recompense  section -->
                    <div class="recent-grid">

                        <div class="Recompenses">
                            <div class="demmande_card">
                                <div class="card-header">
                                    <h3>Récompenses</h3>
                                    <label onclick="ajouterAward()">Ajouter</label>
                                </div>
                                <div class="demmande-card-body">
                                    <div class="table-responsive">
                                        <c:if test="${recompences == null || recompences.isEmpty()}">
                                            <img src="<c:url value="/inc/images/noAwardPic.png"></c:url>" class="center" width="100px"></td>
                                            <h2 style="text-align: center;">Aucune Récompense !</h2>
                                        </c:if>

                                        <c:if test="${recompences != null}">
                                            <table style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <td>Année</td>
                                                        <td>Récompense</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="recompence" items="${recompences}">
                                                        <tr>
                                                            <td>${recompence.annee}</td>
                                                            <td>${recompence.name}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="nouvelleRecompenses" style="display: none;">
                            <!-- Start Recompense Formulaire -->
                            <form method="POST" action="<c:url value="RecompenseForm"></c:url>">
                                <div class="demmande_card">
                                    <div class="card-header">
                                        <h3>Nouvelle Récompenses</h3>
                                    </div>
                                    <div class="demmande-card-body">
                                        <div class="table-responsive">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>Année</td>
                                                    <td>
                                                        <select name="anneeRecompense" id="anneeRecompense"></select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Récompense</td>
                                                    <td><input name="NomRecompense" type="text" class="infoInput"><br></td>
                                                </tr>
                                            </table>
                                            <input name="doc" value="${docteur.cin}" type="hidden" class="infoInput">
                                        </div>
                                        <div class="image-card">
                                            <input type="submit" id="enregistrerRecompenses" value="Enregistrer">
                                            <label id="annulerRecompenses" onclick="hideNewAward()">Annuler</label>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!-- End Recompense Formulaire -->
                        </div>

                    </div>
                    <!-- !Recompense  section -->

                
                
            </div>

            <div class="slidebar-menu" id="Cabinet" style="display: none;">
                
                    <!-- Information du cabinet section -->
                    <div class="recent-grid">
                        <form method="POST" action="<c:url value="InfoCabinet"></c:url>">
                            <div class="InfoCabinet">
                                <div class="demmande_card">
                                    <div class="card-header">
                                        <h3>Informations du cabinet</h3>
                                    </div>
                                    <div class="demmande_card">
                                        <div class="table-responsive">
                                            <table>
                                                <!-- <tr>
                                                    <td><label for="adresseCabinet">Adresse :</label></td>
                                                    <td><input name="adresseCabinet" type="text" class="infoInputCabinet" disabled><br></td>
                                                </tr>
                                                
                                                <tr>
                                                    <td><label for="telephoneCabinet">Telephone :</label></td>
                                                    <td><input name="telephoneCabinet" type="text" class="infoInputCabinet" disabled><br></td>
                                                </tr> -->
                                                <input type="hidden" value="${docteur.cin}" name="id">
                                                <tr>
                                                    <td rowspan="2"><label>Horaires de travail :</label></td>
                                                    <td>
                                                        Le : &nbsp;
                                                        <select name="jour_debut" class="infoInputCabinet" id="jour_debut" disabled>
                                                            <c:forEach var="day" items="${Instances.days()}">
                                                                <option value="${day}" ${ docteur.jourDepart.equals(day) ? 'selected' : '' } }>${day}</option>
                                                            </c:forEach>
                                                            </select>
                                                        <!-- <select name="jour_debut" class="infoInputCabinet" id="jour_debut" disabled></select> -->
                                                        &nbsp; Jusqu'à : &nbsp;
                                                        <select name="jour_fin" class="infoInputCabinet" id="jour_fin" disabled>
                                                            <c:forEach var="day" items="${Instances.days()}">
                                                                <option value="${day}" ${ docteur.jourFin.equals(day) ? 'selected' : '' } }>${day}</option>
                                                            </c:forEach>
                                                            </select>
                                                        <!-- <select name="jour_fin" class="infoInputCabinet" id="jour_fin" disabled></select> -->
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td>
                                                        De : &nbsp;
                                                        <select name="heure_debut" class="infoInputCabinet" id="heure_debut" disabled>
                                                            <c:forEach var="heur" items="${Instances.Heurs()}">
                                                                <option value="${heur}" ${ docteur.heureDepart.equals(heur) ? 'selected' : '' } }>${heur}</option>
                                                            </c:forEach>
                                                            </select>
                                                        <!-- <select name="heure_debut" class="infoInputCabinet" id="heure_debut" disabled></select> -->
                                                        &nbsp; Jusqu'à : &nbsp;
                                                        <select name="heure_fin" class="infoInputCabinet" id="heure_fin" disabled>
                                                            <c:forEach var="heur" items="${Instances.Heurs()}">
                                                                <option value="${heur}" ${ docteur.heureFin.equals(heur) ? 'selected' : '' } }>${heur}</option>
                                                            </c:forEach>
                                                            </select>
                                                        <!-- <select name="heure_fin" class="infoInputCabinet" id="heure_fin" disabled></select> -->
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td rowspan="3"><label for="services">Services :</label></td>
                                                    <td>
                                                        <label for="telemedecine"><input name="telemedecine" type="checkbox" class="infoInputCabinet" value="Télémédecine" <c:if test="${docteur.teleMedcine == true }">checked</c:if> disabled> &nbsp; Télémédecine</label>
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td>
                                                        <label for="Consultation_domicile"><input name="Consultation_domicile" type="checkbox" class="infoInputCabinet" value="Consultation a domicile" <c:if test="${docteur.consultationDomicile == true }">checked</c:if> disabled> &nbsp; Consultation a domicile</label>
                                                    </td>
                                                </tr>
    
                                                <tr>
                                                    <td>
                                                        <label for="renderVousTelephone"><input name="renderVousTelephone" type="checkbox" class="infoInputCabinet" value="Prend rendez-vous par téléphone" <c:if test="${docteur.rtelephonique == true }">checked</c:if> disabled> &nbsp; Prend rendez-vous par téléphone</label>
                                                        
                                                    </td>
                                                </tr>
    
                                            </table>
                                        </div>
    
                                        <div class="image-card">
                                            <label id="modifierInfoCabinet" onclick="modifierInfoCabinet()">Modifier</label>
                                            <input type="submit" id="enregistrerInfoCabinet" value="Enregistrer" style="display: none;">
                                            <label id="annulerInfoCabinet" onclick="reloadPage()" style="display: none;">Annuler</label>
                                        </div>
    
                                    </div>
                                </div>
                            </div>
                        </form>

                        <form method="POST" action="<c:url value="ToggleGarde"></c:url>">
                            <div class="etatCbinet">
                                <div class="demmande_card">
                                    <div class="card-header">
                                        <h3>Etat de travail</h3>
                                    </div>
                                    <div class="demmande_card">
                                        
                                        <div class="toggleDiv">
                                            <label>Congé</label>
                                            <input type="hidden" name="togl" value="${docteur.cin }" />
                                            <c:set var="cDocteur" value="${ docteur.cin }"></c:set>                                            
                                            <label class="switch">
                                            	<c:if test="${docteurDao.getById(cDocteur).getConger()}">
                                                        <input type="checkbox" name="etat" class="toggleInput" id="toggleInput" checked  >
                                                </c:if>
                                                <c:if test="${!docteurDao.getById(cDocteur).getConger()}">
                                                        <input type="checkbox" name="etat" class="toggleInput" id="toggleInput" >
                                                </c:if>
                                                <span class="slider round"  onclick="activetoggleInputs()"></span>
                                            </label>
                                            <label>Active</label>
                                        </div>

                                        <div class="image-card">
                                            <input type="submit" id="enregistrerToggle" value="Enregistrer" style="display: none;">
                                            <label onclick="reloadPage()" id="annulerToggle" style="display: none;">Annuler</label>
                                        </div>
    
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <!-- !Information du cabinet section -->

                    <!-- Localisation du cabinet section -->
                    <form method="POST" action="<c:url value="ChangeLocalisation"></c:url>">
                        <div class="recent-grid">
                            <div class="InfoCabinet">
                                <div class="demmande_card">
                                    <div class="card-header">
                                        <h3>Localosation</h3>
                                    </div>
                                    <div class="demmande_card">
                                        <div class="table-responsive">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td><label for="place_id">Id de location :</label></td>
                                                    <td><input name="place_id" id="place_id" style="width: 100%;" value="${docteur.id }" type="text" disabled></td>
                                                </tr>
                                            </table>
                                           
                                        </div>
                                        <form method="POST" action="<c:url value="IDLocalisation"></c:url>">
                                        	<div class="image-card">
                                        		<input type="hidden" name="loca_id" value="${ docteur.cin }"/>
	                                            <label class="seeplace" onclick="initMap()">Afficher en map</label>
	                                            <label id="modifierplace_id" onclick="modifierplace_id()">Modifier</label>
	                                            <label id="Trouverplace_id" onclick="Trouverplace_id()" style="display: none;">Trouver id</label>
	                                            <input type="submit" id="enregistrerplace_id" value="Enregistrer" style="display: none;">
	                                            <label id="annulerplace_id" onclick="reloadPage()" style="display: none;">Annuler</label>
	                                        </div>
                                        </form>
                                        
                                        <div id="map"></div>
    
                                    </div>
                                </div>
                            </div>

                            <div class="gif">
                                <div class="demmande_card">
                                    <div class="card-header">
                                        <h3>Obtenir id de localisation :</h3>
                                    </div>
                                    <div class="demmande_card">
                                        
                                        <img src="<c:url value="/inc/images/findIdDocPic.png"></c:url>" class="center" width="300px">
    
                                    </div>
                                </div>
                            </div>

                        </div>

                    </form>
                    <!-- !Localisation du cabinet section -->
                
            </div>

            <div class="slidebar-menu" id="Evaluation" style="display: none;">
                <!-- Start Votes -->
                <div class="Votes">
                    <div class="demmande_card">
                        <div class="card-header">
                            <h3>Votes</h3>
                        </div>
                        <div class="demmande_card">

                            <div class="table-responsive">
                                <table style="width: 100%;">
                                    <tr>
                                        <td rowspan="2"><h1>${average}</h1></td>
                                        <td>
                                            <c:set var="nbr" value="${averageOfRating}"></c:set>
                                            <c:set var="result" value="${ 5 - nbr }"></c:set>
                                            <div class="text-warnning">
                                                <c:forEach var="a" begin="1" end="${nbr}">
                                                    <span><i class="las la-lg la-star"></i></span>
                                                </c:forEach>
                                                <c:forEach var="b" begin="1" end="${result}">
                                                    <span><i class="lar la-lg la-star"></i></span>
                                                </c:forEach>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><span style="vertical-align : middle;" class="smallComment"> Basée sur ${numberOfRating} votes</span></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="table-responsive">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 25%;">5 étoiles</td>
                                        <td style="width: 65%;">
                                            <div class="meter orange nostripes">
                                                <span style="width: ${progressBar.getOrDefault(Integer.valueOf(5),"0") }%"></span>
                                            </div>
                                        </td>
                                        <td style="width: 10%;">(${ evaluations.getOrDefault(Integer.valueOf(5),Long.valueOf(0)) })</td>
                                    </tr>

                                    <tr>
                                        <td style="width: 25%;">4 étoiles</td>
                                        <td style="width: 65%;">
                                            <div class="meter orange nostripes">
                                                <span style="width: ${progressBar.getOrDefault(Integer.valueOf(4),"0") }%"></span>
                                            </div>
                                        </td>
                                        <td style="width: 10%;">(${ evaluations.getOrDefault(Integer.valueOf(4),Long.valueOf(0)) })</td>
                                    </tr>

                                    <tr>
                                        <td style="width: 25%;">3 étoiles</td>
                                        <td style="width: 65%;">
                                            <div class="meter orange nostripes">
                                                <span style="width: ${progressBar.getOrDefault(Integer.valueOf(3),"0") }%"></span>
                                            </div>
                                        </td>
                                        <td style="width: 10%;">(${ evaluations.getOrDefault(Integer.valueOf(3),Long.valueOf(0)) })</td>
                                    </tr>

                                    <tr>
                                        <td style="width: 25%;">2 étoiles</td>
                                        <td style="width: 65%;">
                                            <div class="meter orange nostripes">
                                                <span style="width: ${progressBar.getOrDefault(Integer.valueOf(2),"0") }%"></span>
                                            </div>
                                        </td>
                                        <td style="width: 10%;">(${ evaluations.getOrDefault(Integer.valueOf(2),Long.valueOf(0)) })</td>
                                    </tr>

                                    <tr>
                                        <td style="width: 25%;">1 étoile</td>
                                        <td style="width: 65%;">
                                            <div class="meter orange nostripes">
                                                <span style="width: ${progressBar.getOrDefault(Integer.valueOf(1),"0") }%"></span>
                                            </div>
                                        </td>
                                        <td style="width: 10%;">(${ evaluations.getOrDefault(Integer.valueOf(1),Long.valueOf(0)) })</td>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- End Votes -->

                <div class="Commentaires">
                    <div class="demmande_card">
                        <div class="card-header">
                            <h3>Commentaires</h3>
                        </div>
                        <div class="demmande_card">

                            <div class="table-responsive">
                                <c:if test="${commentaires == null || commentaires.isEmpty()}">
                                    <img src="<c:url value="/inc/images/noCommentPic.png"></c:url>" class="center" width="200px"></td>
                                    <h2 style="text-align: center;">Pas de commentaires !</h2>
                                </c:if>

                                <c:if test="${commentaires != null}">
                                    <table width="100%">
                                        <thead>
                                            <tr>
                                                <td>Username</td>
                                                <td>Vote</td>
                                                <td>Commentaire</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="commentaire" items="${commentaires}">
                                                <tr>
                                                    <td>${commentaire.getUser().getFirstname()} ${commentaire.getUser().getLastname()}</td>
                                                    <td style="width: 150px;">
                                                        <div class="text-warnning">
                                                            <span><i class="las la-lg la-star"></i></span>
                                                            <span><i class="las la-lg la-star"></i></span>
                                                            <span><i class="las la-lg la-star"></i></span>
                                                            <span><i class="lar la-lg la-star"></i></span>
                                                            <span><i class="lar la-lg la-star"></i></span>
                                                        </div>
                                                    </td>
                                                        
                                                    <td class="">
                                                        <span class="">${commentaire.getCommentaire()}</span>
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
                
            </div>

            <div class="slidebar-menu" id="Associations" style="display: none;">

                <div class="Hopiteaux">
                    <div class="demmande_card">
                        <div class="card-header">
                            <h3>Hopiteaux</h3>
                        </div>
                        <div class="demmande-card">
                            <div class="table-responsive">
                                <c:if test="${ hopitaux == null || hopitaux.isEmpty() }">
                                    <img src="<c:url value="/inc/images/noHospitalPic.png"></c:url>" class="center" width="100px"></td>
                                    <h2 style="text-align: center;">Aucun hopital !</h2>
                                </c:if>

                                <c:if test="${!hopitaux.isEmpty()}">
                                    <table width="100%">
                                        <tbody>
                                            <c:forEach var="hopital" items="${hopitaux}">
                                                <tr>
                                                    <td>${hopital.name}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <div class="Cliniques">
                    <div class="demmande_card">
                        <div class="card-header">
                            <h3>Cliniques</h3>
                        </div>
                        <div class="demmande-card">
                            <div class="table-responsive">
                                <c:if test="${ (cliniques.isEmpty()) || (cliniques == null) }">
                                    <img src="<c:url value="/inc/images/noClinicPic.png"></c:url>" class="center" width="100px"></td>
                                    <h2 style="text-align: center;">Aucun clinique !</h2>
                                </c:if>

                                <c:if test="${!cliniques.isEmpty()}">
                                    <table width="100%">
                                        <tbody>
                                            <c:forEach var="clinique" items="${cliniques}">
                                                <tr>
                                                    <td>${clinique.name}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
    
                                    </table>
                                </c:if>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="slidebar-menu" id="Authentification" style="display: none;">

                <div class="Authentification">
                    <div class="demmande_card">
                        <div class="card-header">
                            <h3>Authentification</h3>
                        </div>
                        <div class="demmande-card">
                            <form method="POST" action="<c:url value="EuthentificationDoc"></c:url>">
                                <div class="table-responsive">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 50%;"><label>Ancien mot de passe :</label></td>
                                            <td>
                                                <input style="width: 100%;" type="password" name="oldMdp" class="authInput" disabled><input type="hidden" name="id" value="${docteur.cin}" class="input">
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td style="width: 50%;"><label>Nouveau mot de passe :</label></td>
                                            <td><input style="width: 100%;" type="password" name="newMdp" class="authInput" disabled></td>
                                        </tr>
                                        
                                        <tr>
                                            <td style="width: 50%;"><label>Confirmation de nouveau mot de passe :</label></td>
                                            <td><input style="width: 100%;" type="password" name="confirmationNewMdp" class="authInput" disabled></td>
                                        </tr>
            
                                    </table>
                                </div>
    
                                <div class="image-card">
                                    <label id="modifierAuth" onclick="modifierAuth()">Modifier</label>
                                    <input type="submit" id="enregistrerAuth" value="Enregistrer" style="display: none;">
                                    <label id="annulerAuth" onclick="reloadPage()" style="display: none;">Annuler</label>
                                </div>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>

    
    
    <script type="text/javascript" src="<c:url value="/DoctorDashboard/assets/js/dashboard.js"/>"></script>
</body>
</html>