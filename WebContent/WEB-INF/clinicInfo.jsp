<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>>Doctor's infos</title>
  <link rel="stylesheet" href="<c:url value="./assets/styleInfos.css" />">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="container">  
  <form id="contact" action="<c:url value="SendEmail"/>" method="post">
    <h3>Informations du clinique</h3>
    <fieldset>
      <input type="hidden" name="id" value="${clinic.cin}">
      <input placeholder="clinic's name" type="text" tabindex="1" value="${clinic.name }" autofocus>
    </fieldset>
    <fieldset>
      <input placeholder="clinic's adresse" type="text" tabindex="1" value="${clinic.adresse }" autofocus>
    </fieldset>
    <fieldset>
      <input placeholder="clinic's Email Address" type="email" name="email" value="${clinic.email }" tabindex="2" >
    </fieldset>
    <fieldset>
      <input placeholder="clinic's Phone Number" type="tel" value="${clinic.tel }" tabindex="3" >
    </fieldset>
    <fieldset>
      <input placeholder="clinic's emergency tel" type="text" value="${clinic.emergency_tel }" tabindex="4" >
    </fieldset>
    <fieldset>
      <input placeholder="clinic speciality " type="text" value="${clinic.speciality }" tabindex="4" >
    </fieldset>
    <fieldset>
      	<button name="approvec" type="submit" id="demmande_approve" data-submit="...Sending">approve</button>
    </fieldset>
    <fieldset>
  		  <button name="desapprovec" type="submit" id="demmande_desapprove" data-submit="...Sending" style="background-color: #d11a2a;">desapprove</button>
  	</fieldset>
  </form>
  
</div>
<!-- partial -->
  
</body>
</html>