<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form </title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="inc/fonts/material-icon/css/material-design-iconic-font.min.css">
    
    <!-- Main css -->
    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/css/bootstrap-select.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/0.8.2/css/flag-icon.min.css'>

    <link rel="stylesheet" href="inc/css/style.css">
    
    <style type="text/css">
    	.logo{
			position: fixed;
			top: 60px;
			left: 150px;
		}
    </style>

</head>
<body>
	<div class="logo">
    	<a href="<c:url value="/Home"></c:url>"><img src="<c:url value="/DoctorProfile/EHealthLogo.png"></c:url>" width="250px" alt=""></a>
    </div>
    <div class="main">

        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <form action ="<%=request.getContextPath()%>/doctorForm" method="POST" id="signup-form" class="signup-form" enctype="multipart/form-data" >
          	                        <h2 class="form-title">Create account</h2>
          	
                        <div class="form-group input-container" data-error="prénom trop court">
                            <input type="text" class="form-input" name="firstname" id="name" placeholder="Votre prénom" required oninvalid="this.setCustomValidity('Veuillez saisir votre prénom')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.doctor.firstname}"/>" />
                            <%-- <span class="erreur" >${form.erreurs['firstname']}</span>  --%>     
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="lastname" id="name" placeholder="Votre nom" required oninvalid="this.setCustomValidity('Veuillez saisir votre nom')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.doctor.lastname}"/>" />
                            <%-- <span class="erreur" >${form.erreurs['lastname']}</span> --%>      
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Votre email" required oninvalid="this.setCustomValidity('Veuillez saisir une adresse e-mail')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.doctor.email}"/>" />
                             <span class="erreur" >${form.erreurs['email']}</span>  
                        </div>
                        <div class="form-group">
                            <input type="tel" class="form-input" name="tel" id="tel" placeholder="Votre numero de telephone" required oninvalid="this.setCustomValidity('Veuillez saisir votre numero de tel')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.doctor.tel}"/>" />
                             <span class="erreur" >${form.erreurs['tel']}</span>  
                        </div>
                        <div class="form-group">
                          <input type="text" class="form-input" name="ville" id="ville" placeholder="Votre ville" required oninvalid="this.setCustomValidity('Veuillez saisir votre ville')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.doctor.ville}"/>"/>                          
                        </div>
                        

                        <!-- languages -->
           		       
                        <select name="languages" class="selectpicker" style="margin:10px 0; width:100%" data-width="fit"  multiple>
		                      <option  data-content='<span class="flag-icon flag-icon-us"></span> English'>English</option>
		                      <option  data-content='<span class="flag-icon flag-icon-mx"></span> Spanish'>Spanish</option>
		                      <option  data-content='<span class="flag-icon flag-icon-cn"></span> Chinese'>Chinese</option>
		                      <option  data-content='<span class="flag-icon flag-icon-fr"></span> Frensh'>Frensh</option>
		                      <option  data-content='<span class="flag-icon flag-icon-ma"></span> Arabic'>Arabic</option>
                       </select>
                       <span class="erreur" style="display:block" >${form.erreurs['languages']}</span>
                        
                        <!-- languages -->
                        
                                                
                        <!-- Profile Photo -->
                      <div class="form-group" id="upload-container">
                        <label class="label-file">Merci de déposer votre photo de profile :</label>
                        <div  id="upload-border">
                          <nobr>
                            <input type="text" id="upload-name1"   disabled="true" />
                            <label id="upload-button1">Cliquez moi!</label>
                          </nobr>
                        </div>
                        <input name="profile_image" type="file" id="hidden-upload1" style="display:none" multiple/>
                         <span class="erreur" >${form.erreurs['id_scan']}</span>
                      </div> 
                      <!-- !Profile Photo -->
                        
                       <div class="form-group" id="Speciality">
                       		<label class="label-file">Merci de spécifier votre specialitier :</label>
	                        <select name="speciality" class="select-css" >
		                         <c:forEach var="specia" items="${Instances.specialities()}">
		                             <option value="${specia}" ${clinique.speciality.equals(specia) ? 'selected' : '' } }>${specia}</option>
		                         </c:forEach>
	                        </select>
                       </div>
                        <!-- select  -->
                        
                        
                        <div class="form-group">
                            <input type="checkbox" class="form-input" name="agree-term" id="agree-term" onClick="checkTerms(event);"/>
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="inc/terms.html" class="term-service">Terms of service</a></label>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up" onClick="postLogin(event);" disabled='disabled'/>
                        </div>
                    </form>
                    <p class="loginhere">
                        Have already an account ? <a href="<c:url value="signIn" />" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>
    <!-- JS -->

     <script src="inc/js/files.js"></script>
     <script src="inc/js/terms.js"></script>
     <script src="inc/js/doctorjs.js"></script>
   
        <!--language js -->
      <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.2/js/bootstrap-select.min.js'></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js'></script>
    <script  src="inc/js/languages.js"></script>
    <!-- languages -->
    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- JS -->
    
</body>
</html>