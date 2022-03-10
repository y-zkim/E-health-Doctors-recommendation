<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>${user.firstname} ${user.lastname}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap CDN -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

  <!-- Custom CSS file -->
  <link rel="stylesheet" href="<c:url value="/DoctorSearch/style.css" />">

</head>
<body>
  <header class="color-primary-bg py-2" style="width: 100%;">
    <div class="row" >
        <div class="col-lg-3 d-flex justify-content-start">
            <a class="navbar-brand mx-3" href="<c:url value="/Home"></c:url>"><img src="<c:url value="/DoctorProfile/EHealthLogo.png"></c:url>" width="200px" alt=""></a>
            <button type="button" class="btn show-mobile font-size-20 mt-2 font-gilroy-bold color-second text-right" id="showNavBarBtn" data-target="#nav_bar">
                <i class="fas fa-bars"></i>                      
            </button>
        </div>

        <div class="col-lg-6 d-flex justify-content-center">
            <div class="row" id="nav_bar">

                <div class="col-sm-1"></div>

                <div class="col-sm-2">
                    <a class="nav-link text-white font-gilroy-bold font-size-20" href="<c:url value="/Home#section-1"></c:url>">Acceuil</a>
                </div>

                <div class="col-sm-2">
                    <a class="nav-link text-white font-gilroy-bold font-size-20" href="<c:url value="/Home#section-2"></c:url>">Medecin</a>
                </div>

                <div class="col-sm-2">
                    <a class="nav-link text-white font-gilroy-bold font-size-20" href="<c:url value="/Home#section-3"></c:url>">Hopital</a>
                </div>

                <div class="col-sm-2">
                    <a class="nav-link text-white font-gilroy-bold font-size-20" href="<c:url value="/Home#section-4"></c:url>">Clinique</a>
                </div>

                <div class="col-sm-2">
                    <a class="nav-link text-white font-gilroy-bold font-size-20" href="<c:url value="/Home#section-5"></c:url>">Pharmacie</a>
                </div>

                <div class="col-sm-1"></div>
            </div>
        </div>

        <div class="col-lg-3 d-flex justify-content-lg-end">
            <table>
                <tr>
                    <td class="py-0"><h5 class=" font-size-14 text-white font-montserrat">${ sessionScope.visiter.getFirstname() } ${ sessionScope.visiter.getLastname() }</h5></td>
                </tr>
                <tr>
                    <c:if test="${ sessionScope.visiter != null || sessionScope.admin != null || sessionScope.clinique != null || sessionScope.docteur != null }">
                      <td class="py-0"><a href="<c:url value="Deconnexion"></c:url>" class="btn btn-outline-dark btn-info font-size-12 py-1 text-white">Deconnexion</a></td>
                    </c:if>
                    <c:if test="${ sessionScope.visiter == null && sessionScope.admin != null && sessionScope.clinique != null && sessionScope.docteur != null}">
                      <td class="py-0"><a href="<c:url value="signIn"></c:url>" class="btn btn-outline-dark btn-info font-size-12 py-1 text-white">connexion</a></td>
                    </c:if>
                </tr>
            </table>
        </div>
    </div>
  </header>

  <form method="POST" action="<c:url value="UserProfile"></c:url>"  class="form-horizontal">
    <div class="container container-fluid border my-3">
      <div class="row py-2 border-bottom bg-light">
        <div class="col-lg-12">
          <h3 class="font-gilroy text-dark">Votre informations</h3>
        </div>
      </div>

      <div class="row py-2">
        <div class="col-lg-12">
          <div class="row form-group">
            <label class="col-lg-4">Nom</label>
            <div class="col-lg-8">
              <input type="text" name="nom" value="${user.lastname}" class="infoInput form-control" disabled>
            </div>
          </div>

          <div class="row form-group">
            <label class="col-lg-4">Prénom</label>
            <div class="col-lg-8">
              <input type="text" name="prenom" value="${user.firstname}" class="infoInput form-control" disabled>
            </div>
          </div>

          <div class="row form-group">
            <label class="col-lg-4">Email</label>
            <div class="col-lg-8">
              <input type="text" name="email" value="${user.email}" class="infoInput form-control" disabled>
            </div>
          </div>

          <div class="row form-group">
            <label class="col-lg-4">Téléphone</label>
            <div class="col-lg-8">
              <input type="text" name="tel" value="${user.tel}" class="infoInput form-control" disabled>
            </div>
          </div>
        </div>
      </div>

      <div class="row py-2">
        <div class="col-lg-12">
          <div class="d-flex justify-content-center">
            <label id="modifierInfoModif" class="btn btn-info" onclick="activeInfoModif()">Modifier</label>
            <button id="enregistrerInfoModif" name="changeInfo" value="info" type="submit" class="btn btn-info" style="display: none;">Enregistrer</button>
            <label id="anullerInfoModif" class="btn btn-info ml-3" onclick="reloadPage()" style="display: none;">Annuler</label>
          </div>
        </div>
      </div>
    </div>
  </form>

  <form method="POST" action="<c:url value="UserProfile"></c:url>">
    <div class="container container-fluid border my-3">
      <div class="row py-2 border-bottom bg-light">
        <div class="col-lg-12">
          <h3 class="font-gilroy text-dark">Authentification</h3>
        </div>
      </div>

      <div class="row py-2">

        <div class="col-lg-12">
          <div class="row form-group">
            <label class="col-lg-4 control-label">Current password</label>
            <div class="col-lg-8">
              <input type="password" name="last_pass" class="passInput form-control" disabled>
            </div>
          </div>

          <div class="row form-group">
            <label class="col-lg-4 control-label">New password</label>
            <div class="col-lg-8">
              <input type="password" name="new_pass" class="passInput form-control" disabled>
            </div>
          </div>
	
          <div class="row form-group">
            <label class="col-lg-4 control-label">Confirmation password</label>
            <div class="col-lg-8">
              <input type="password" name="confirmation" class="passInput form-control" disabled>
            </div>
          </div>

        </div>
      </div>
	<input type="hidden" name="email_pass" value="${user.email}" class="infoInput form-control">
      <div class="row py-2">
        <div class="col-lg-12">
          <div class="d-flex justify-content-center">
            <label id="modifierPassModif" class="btn btn-info" onclick="activePassModif()">Modifier</label>
            <button id="enregistrerPassModif" name="changePass" value="pass"type="submit" class="btn btn-info" style="display: none;">Enregistrer</button>
            <label id="anullerPassModif" class="btn btn-info ml-3" onclick="reloadPage()" style="display: none;">Annuler</label>
          </div>
        </div>
      </div>
    </div>
  </form>

  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script>
    function activeInfoModif(){
      var infoInputs = document.getElementsByClassName("infoInput");
      for(var i = 0; i < infoInputs.length; i++) {
        infoInputs[i].disabled = false;
      }

      document.getElementById("modifierInfoModif").style.display = "none";
      document.getElementById("enregistrerInfoModif").style.display = "inline";
      document.getElementById("anullerInfoModif").style.display = "inline";
    }
    
    function activePassModif(){
      var passInputs = document.getElementsByClassName("passInput");
      for(var i = 0; i < passInputs.length; i++) {
        passInputs[i].disabled = false;
      }

      document.getElementById("modifierPassModif").style.display = "none";
      document.getElementById("enregistrerPassModif").style.display = "inline";
      document.getElementById("anullerPassModif").style.display = "inline";
    }

    function reloadPage() {
      location.reload();
    }
  </script>
  
  <!-- Custom Javascript -->
  <script src="<c:url value="/DoctorSearch/JSIndex.js" />"></script>
</body>
</html>