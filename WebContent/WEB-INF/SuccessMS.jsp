<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Visiter's selected information</title>
<script src="https://bootstrapcreative.com/wp-bc/wp-content/themes/wp-bootstrap/codepen/bootstrapcreative.js?v=7"></script><link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css'><link rel="stylesheet" href="./style.css">
    <style>
        .ms{
            display: grid;
            justify-content: center;
            margin-top: 200px;
        }
        .display-3{
            color:#4BB543 ;
        }
    </style>

</head>
<body>
    <div class="ms">
<div class="jumbotron text-center">
  <h1 class="display-3">Merci!</h1>
  <p class="lead"><strong>Veuillez consulter votre mailBox</strong> pour obtenir des instructions supplémentaires sur la façon de terminer la configuration de votre compte.</p>
  <hr>
  <p>
    avoir des problèmes? <a href="mailto:contact@example.com">Contacter nous</a>
  </p>
  <p class="lead">
    <a class="btn btn-primary btn-sm" href="<c:url value="/Home"/>" role="button">Continuer vers la page d'accueil</a>
  </p>
</div>
</div>
</body>
</body>
</html>