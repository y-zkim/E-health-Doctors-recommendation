<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form </title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="inc/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="inc/css/style.css">
 <style>
	body {
	    background-image: url("inc/images/happyboy.jpg");
	    
	}
	  .signIn_container{
	    width: 500px;
	    position: relative;
	    margin-left: auto;
	    margin-right: 60px;
	    box-shadow:0 1px 3px rgba(0,0,0,0.2);
	    transition:all 0.2s ease-in-out;
	
	  }
	  .signIn_container:hover{
	    transform:scale(1.02);
	    transition:all 0.2s ease-in-out;
	    cursor: pointer;
	}
	
	.logo{
		position: fixed;
		top: 60px;
		left: 150px;
	}

</style>
</head>
<body class="signIn">
    <div class="logo">
    	<a href="<c:url value="/Home"></c:url>"><img src="<c:url value="/DoctorProfile/EHealthLogo.png"></c:url>" width="250px" alt=""></a>
    </div>
    <div class="main">

        <section class="signup">
            <div class="signIn_container" >
            	
                <div class="signup-content">
                    <form action ="<c:url value="/signIn" />" method="post" id="signup-form" class="signup-form">
                        <h2 class="form-title">Sign In</h2>
                        
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Your Email" required oninvalid="this.setCustomValidity('Veuillez saisir une adresse e-mail')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.visiter.email}"/>" />
                             <span class="erreur" >${form.erreurs['email']}</span>  
                        </div>
                        
                       <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password" required oninvalid="this.setCustomValidity('Veuillez saisir votre mot de passe')" oninput="setCustomValidity('')" placeholder="Password" />
                            <span class="erreur" >${form.erreurs['password']}</span>
                            <span toggle="#password" class="zmdi zmdi-eye-off field-icon toggle-password"></span>
                        </div>
                        <c:if test="${message_erreur != null}">
	               			<span style="color:red">${message_erreur}</span>
	               			<br>
                        </c:if>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
                        </div>
                    </form>
                 
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="inc/vendor/jquery/jquery.min.js"></script>
    <script src="inc/js/password.js"></script>
</body>
</html>