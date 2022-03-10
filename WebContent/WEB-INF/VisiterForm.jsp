<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form </title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="inc/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="inc/css/style.css">
</head>
<body>
	<div class="logo">
    	<a href="<c:url value="/Home"></c:url>"><img src="<c:url value="/DoctorProfile/EHealthLogo.png"></c:url>" width="250px" alt=""></a>
    </div>
    <div class="main">

        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <form action ="<%=request.getContextPath()%>/visiterForm" method="POST" id="signup-form" class="signup-form">
                        <h2 class="form-title">Create account</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="firstname" id="name" placeholder="Your Firstname" required oninvalid="this.setCustomValidity('Veuillez saisir votre prénom')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.visiter.firstname}"/>" />
                            <%-- <span class="erreur" >${form.erreurs['firstname']}</span> --%>      
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="lastname" id="name" placeholder="Your Lastname" required oninvalid="this.setCustomValidity('Veuillez saisir votre nom')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.visiter.lastname}"/>" />
                            <%-- <span class="erreur" >${form.erreurs['lastname']}</span>  --%>     
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-input" name="email" id="email" placeholder="Your Email" required oninvalid="this.setCustomValidity('Veuillez saisir une adresse e-mail')" oninput="setCustomValidity('')" value="<c:out value="${requestScope.visiter.email}"/>" />
                             <span class="erreur" >${form.erreurs['email']}</span>  
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password" placeholder="Password" required oninvalid="this.setCustomValidity('Veuillez saisir un mot de passe')" oninput="setCustomValidity('')" />
                            <span class="erreur" >${form.erreurs['password']}</span>
                            <span toggle="#password" class="zmdi zmdi-eye-off field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="confirmation" id="re_password" required oninvalid="this.setCustomValidity('Veuillez confirmer votre mot de passe')" oninput="setCustomValidity('')" placeholder="Repeat your password" />
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" onClick="checkTerms(event);" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="inc/terms.html" target="_blank" class="term-service">Terms of service</a></label>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign up"/>
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
    <script src="inc/vendor/jquery/jquery.min.js"></script>
    <script src="inc/js/password.js"></script>
    <script src="inc/js/terms.js"></script>
</body>
</html>