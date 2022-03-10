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
    <h3>Doctor's infos</h3>
    <fieldset>
      <input type="text" name="id" value="${ doc.cin }" hidden />
      <input placeholder="doc's name" type="text" tabindex="1" value="${doc.firstname }" autofocus>
    </fieldset>
    <fieldset>
      <input placeholder="doc's lastname" type="text" tabindex="1" value="${doc.lastname }" autofocus>
    </fieldset>
    <fieldset>
      <input placeholder="doc's Email Address" type="email" name="email" value="${doc.email }" tabindex="2" >
    </fieldset>
    <fieldset>
      <input placeholder="doc's Phone Number" type="tel" value="${doc.tel }" tabindex="3" >
    </fieldset>
    <fieldset>
      <input placeholder="doc's speciality" type="text" value="${doc.speciality }" tabindex="4" >
    </fieldset>
    <fieldset>
      	<button name="approve" type="submit" id="demmande_approve" data-submit="...Sending">approve</button>
    </fieldset>
    <fieldset>
  		  <button name="desapprove" type="submit" id="demmande_desapprove" data-submit="...Sending" style="background-color: #d11a2a;">desapprove</button>
  	</fieldset>
  </form>
  
</div>
<!-- partial -->
  
</body>
</html>