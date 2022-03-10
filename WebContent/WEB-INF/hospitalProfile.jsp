<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${hopital.name}</title>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">


    <!-- Owl-carousel CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha256-UhQQ4fxEeABh4JrcmAJ1+16id/1dnlOEVCFOxDef9Lw=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha256-kksNxjDRxd/5+jGurZUJd1sdR2v+ClrCl3svESBaJqw=" crossorigin="anonymous" />

    <!-- font awesome icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />

    <!-- fonts importation -->
    <link rel="stylesheet" href="https://cdn.rawgit.com/mfd/09b70eb47474836f25a21660282ce0fd/raw/e06a670afcb2b861ed2ac4a1ef752d062ef6b46b/Gilroy.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;400&display=swap" rel="stylesheet">

    <!-- Google Maps API -->
    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcybDNa2i9CePsLK9l7rAhcAafXMGALcY&libraries=places&callback=initMapHospitalProfile"> </script>

    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/HospitalProfile/pageLogo.png"/>"/>

    <!-- Custom CSS file -->
    <link rel="stylesheet" href="<c:url value="/HospitalProfile/style.css" />">
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
                        <c:if test="${ sessionScope.visiter != null}">
                        	<td class="py-0"><a href="<c:url value="Deconnexion"></c:url>" class="btn btn-outline-dark btn-info font-size-12 py-1 text-white">Deconnexion</a></td>
                        </c:if>
                        <c:if test="${ sessionScope.visiter == null}">
                        	<td class="py-0"><a href="<c:url value="signIn"></c:url>" class="btn btn-outline-dark btn-info font-size-12 py-1 text-white">connexion</a></td>
                        </c:if>
                    </tr>
                </table>
            </div>

        </div>
    </header>

    <!-- HopitalProfile -->
    <section  id="HopitalProfile">
        
        <!-- InformationsPersonelle -->
        <div class="row color-primary-bg border-buttom px-4" id="InformationsPersonelle">
            <div class="container text-white">
                <div class="row py-3">
                    <div class="col-md-3 text-xs-center px-4 py-2">
                        <div class="row text-center justify-content-center">
                            <i class="fas fa-hospital fa-5x mx-1 my-1 text-white text-center"></i>
                        </div>
                        <c:set var="nbr" value="${averageRating}"></c:set>
                        <c:set var="result" value="${ 5 - nbr}"></c:set>
                        <div class="row text-center justify-content-center">
                            <div class="rating font-size-14 mt-2 text-white">
                                <c:forEach var="e" begin="1" end="${nbr}">
                                    <span><i class="fas text-warning fa-star"></i></span>  
                                </c:forEach>
                                <c:forEach var="e" begin="1" end="${result}">
                                    <span><i class="far fa-star"></i></span>
                                </c:forEach>
                                <!-- Math.around() -->
                                <br><span class="font-gilroy-bold">${nbrRating} votes</span><br>
                                <a class="btn btn-outline-info border-0 text-white font-size-16 font-gilroy-bold" href="#Evaluation">Laisser votre avis</a>
                            </div>
                        </div>
                        
                    </div>

                    <div class="col-md-9 text-xs-center px-4 py-2">
                        <div class="border-bottom">
                            <h2 class="font-gilroy-bold fullName">${hopital.name}</h2>
                        </div>

                        <c:if test="${hopital.description != null}">
                            <div class="mt-3">
                                <p class="font-noto text-justify font-size-14 mt-3">
                                    &nbsp;&nbsp;&nbsp;&nbsp; ${hopital.description}
                                </p>
                            </div>
                        </c:if>

                        <div class="mt-3 py-2 border-top">
                            <div class="row justify-content-center">
                                <div class="font-size-12 font-montserrat text-center">
                                    <div class="mt-3 text-white font-size-16 font-montserrat" type="button">
                                        <span class="btn btn-info rounded py-1">
                                            <i class="fas fa-phone-alt"></i>
                                            <span class="weight-bold">&nbsp; +212${telephone}</span> 
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- !InformationsPersonelle -->

        <!-- Sections navbar -->
        <div class="color-primary-bg border-buttom px-4" id="SectionsNavbar">
            <div class="container text-center justify-content-center" id="">

                <div class="btn-group btn-group-toggle" data-toggle="buttons" id="scrollingNavbar">
                    
                    <label>
                        <a href="#InformationsPersonelle" class="btn btn-outline-info border-0 rounded text-white">
                            <input type="radio" name="NavbarOptions" id="InformationsPersonelleBtn" autocomplete="off" hidden> Informations Personelle
                        </a>
                    </label>
                    
                    <label>
                        <a href="#Localisation" class="btn btn-outline-info border-0 rounded text-white">
                            <input type="radio" name="NavbarOptions" id="LocalisationBtn" autocomplete="off" hidden> Localisation
                        </a>
                    </label>

                    <label>
                        <a href="#Evaluation" class="btn btn-outline-info border-0 rounded text-white">
                            <input type="radio" name="NavbarOptions" id="EvaluationBtn" autocomplete="off" hidden> Evaluation
                        </a>
                    </label>

                    <label>
                        <a href="#Docteurs" class="btn btn-outline-info border-0 rounded text-white">
                            <input type="radio" name="NavbarOptions" id="DocteursBtn" autocomplete="off" hidden> Docteurs
                        </a>
                    </label>
                </div>
                
            </div>
        </div>
        <!-- !Sections navbar -->

        <!-- Localisation -->
        <div class="row py-3" id="Localisation">
            <div class="container py-5">
                <div class="pt-5 pb-2 border-bottom border-info">
                    <h3 class="container text-left font-gilroy-bold color-primary ">Localisation</h3>
                </div>

                <!-- Localisation on Map -->
                <div class="px-5 mt-3" id="mapLocalisation">
                    <div id="map" class="z-depth-1-half map-container my-5 mx-5">
                        <span id="place_id" hidden>${hopital.id}</span>
                    </div>

                    <div class="border py-3 px-3">
                        <div class="text-xs-center">
                            <div class="color-dark">
                                <h4 class="font-size-20 font-weight-bold font-montserrat">Hopital Hassan II Agadir</span> </h4>
                            </div>

                            <div class="row">
                                <div class="col-md-6 pt-3 px-3">
                                    <i class="fas fa-map-marker-alt text-danger"></i>
                                    <span id="place_adresse" class="font-size-14 font-weight-bold font-montserrat color-primary"></span><br>
                                    <a id="direction_anchor" href="" target="_blank" class="font-size-14 font-weight-bold font-montserrat color-second px-2 border-right border-left">Direction</a>
                                </div>

                                <div class="col-md-6 font-size-12 font-montserrat d-flex justify-content-center">
                                    <div class="mt-3 font-size-16 font-montserrat font-weight-bold" type="button">
                                        <span class="btn bg-danger rounded px-3 py-1 text-white">
                                            <i class="fas fa-phone-alt"></i>
                                            <span class="weight-bold font-weight-bold">&nbsp; +212${hopital.tel}</span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Evaluation -->
        <div class="row py-3" id="Evaluation">
            <div class="container py-5">
                <div class="pt-5 pb-2 border-bottom border-info">
                    <h3 class="container text-left font-gilroy-bold color-primary ">Evaluation</h3>
                </div>

                <!-- Rating statics-->
                <div class="px-5 mt-3" id="rating_statics">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="row">
                                <h6 class="font-noto" id="evaluation_upper_text_hospital"></h6>
                            </div>
                            
                            <div class="row">
                                <div class="col-xs-2">
                                    <h1 class="font-gilroy-bold">${average}</h1>
                                </div>
                                <div class="col-xs-10 ml-3">
                                    <div class="rating font-size-14 mt-1 text-warning">
                                        <c:forEach var="e" begin="1" end="${nbr}">
                                            <span><i class="fas fa-star"></i></span>    
                                        </c:forEach>
                                        <c:forEach var="e" begin="1" end="${result}">
                                            <span><i class="far fa-star"></i></span>
                                        </c:forEach>
                                        <!-- Math.around() -->
                                        <br><span class="font-gilroy-bold text-dark">Basee sur ${nbrRating} votes</span>
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="row">

                                <table class="font-gilroy rating-table">
                                    <tr>
                                        <td>5 étoiles</td>
                                        <td style="width: 360px;">
                                            <div class="progress position-relative" style="height: 10px;">
                                                <div class="progress-bar" role="progressbar" style="width: ${progressBar.getOrDefault(Integer.valueOf(5),"0") }%;" aria-valuenow="1.5" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td>(${ distinctValueRating.getOrDefault(Integer.valueOf(5),Long.valueOf(0)) })</td>
                                    </tr>

                                    
                                    <tr>
                                        <td>4 étoiles</td>
                                        <td>
                                            <div class="progress position-relative" style="height: 10px;">
                                                <div class="progress-bar" role="progressbar" style="width: ${progressBar.getOrDefault(Integer.valueOf(4),"0") }%;" aria-valuenow="31.25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td>(${ distinctValueRating.getOrDefault(Integer.valueOf(4),Long.valueOf(0)) })</td>
                                    </tr>

                                    <tr>
                                        <td>3 étoiles</td>
                                        <td>
                                            <div class="progress position-relative" style="height: 10px;">
                                                <div class="progress-bar" role="progressbar" style="width: ${progressBar.getOrDefault(Integer.valueOf(3),"0") }%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td>(${ distinctValueRating.getOrDefault(Integer.valueOf(3),Long.valueOf(0)) })</td>
                                    </tr>

                                    <tr>
                                        <td>2 étoiles</td>
                                        <td>
                                            <div class="progress position-relative" style="height: 10px;">
                                                <div class="progress-bar" role="progressbar" style="width: ${progressBar.getOrDefault(Integer.valueOf(2),"0") }%;" aria-valuenow="18.75" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td>(${ distinctValueRating.getOrDefault(Integer.valueOf(2),Long.valueOf(0)) })</td>
                                    </tr>

                                    <tr>
                                        <td>1 étoile</td>
                                        <td>
                                            <div class="progress position-relative" style="height: 10px;">
                                                <div class="progress-bar" role="progressbar" style="width: ${progressBar.getOrDefault(Integer.valueOf(1),"0") }%;" aria-valuenow="15.62" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </td>
                                        <td>(${distinctValueRating.getOrDefault(Integer.valueOf(1),Long.valueOf(0))})</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="col-md-6 text-center justify-content-center">
                            <div class="card mt-4" id="user_rate_card">
                                <div class="card-body py-3">
                                    <img class="mx-2 my-3 rounded mx-auto d-block" src="<c:url value="/DoctorProfile/EHealthLogo.png"/>" alt="Logo" height="50px">
                                    <h6 class="card-title mb-2 text-muted">Donnez votre évaluation</h6>
                                    <p class="card-text card-doctor-text"></p>
                                    <!-- If he already voted -->
                                   
                                    <c:if test="${ sessionScope.visiter == null }">
                                        <div class="container">
                                            <div class="rating font-size-20 text-warning">
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="far fa-star"></i></span>
                                            </div>
                                        </div>
                                        <c:if test="${ sessionScope.visiter != null && sessionScope.docteur == null && sessionScope.clinique == null && sessionScope.admin == null }">
                                        	<form method="get" action="<c:url value="signIn"></c:url>">
	                                            <button id="rateBtn" type="submit" class="btn font-size-16 font-gilroy-bold color-second">Se connecter</button>
	                                        </form>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${ sessionScope.visiter != null }">
                                        <c:set var="nbrEtoileUser" value="${ ratingImpl.getNumberOfEtoileByUserAndHopital(sessionScope.visiter, hopital) != null ? ratingImpl.getNumberOfEtoileByUserAndHopital( sessionScope.visiter , hopital) : Long.valueOf(0) }"></c:set>
	    								<c:set var="resultUser" value="${ 5 - nbrEtoileUser }"></c:set>
	                                    <div class="container">
	                                        <div class="rating font-size-20 text-warning">
	                                            <c:forEach var="counter" begin="1" end="${ nbrEtoileUser }">
	                                            	<span><i class="fas fa-star"></i></span>
	                                            </c:forEach>
	                                            <c:forEach var="counr" begin="1" end="${ resultUser }">
		                                           	<span><i class="far fa-star"></i></span>
	                                            </c:forEach>
	                                        </div>
	                                    </div>
                                        <button id="rateBtn" class="btn font-size-16 font-gilroy-bold color-second">Laisser une évaluation</button>
                                    </c:if>

                                    <!-- The Modal -->
                                    <div id="myModal" class="modal">
                                        <!-- Modal content -->
                                        <div class="modal-content">
                                            <span class="close">&times;</span>
                                            <div class="card mt-4">
                                                <div class="card-body py-3">
                                                    <img class="mx-2 my-3 rounded mx-auto d-block" src="<c:url value="/DoctorProfile/EHealthLogo.png"/>" alt="Logo" height="50px">
                                                    <h6 class="card-title mb-2 text-muted">Donnez votre évaluation</h6>
                                                    <p class="card-text card-doctor-text"></p>

                                                    <form action="<%=request.getContextPath()%>/addComment" method="post">
                                                        <div class="container">
                                                            <div class="font-size-20 starrating risingstar d-flex justify-content-center flex-row-reverse">
                                                                <input type="radio" id="star5" name="ratingStars" value="5" /><label for="star5" title="5 star"></label>
                                                                <input type="radio" id="star4" name="ratingStars" value="4" /><label for="star4" title="4 star"></label>
                                                                <input type="radio" id="star3" name="ratingStars" value="3" /><label for="star3" title="3 star"></label>
                                                                <input type="radio" id="star2" name="ratingStars" value="2" /><label for="star2" title="2 star"></label>
                                                                <input type="radio" id="star1" name="ratingStars" value="1" /><label for="star1" title="1 star"></label>
                                                                <input type="text" name="nbretoilerat" value="" id="userRating" hidden>
                                                            </div>
    
                                                            <div id="OwnComment" class="card bg-light">
                                                                <div class="user-card card-body">
                                                                    <div >
                                                                        <h3 class="font-size-16 font-golroy-bold">Laisser un commentaire</h3>
                                                                        <h4 id="comment_header" class="font-size-14 font-montserrat">Quesque vous penser apropot de service de </h4>
                                                                    </div>
                                        
                                                                    <textarea name="comment_hopital" id="userOwnComment" class="form-control" rows="3" disabled></textarea>
                                                                    <h3 id="rating_notice" class="font-size-12 font-golroy-bold"><em>** Vous devez laisser une évaluation avant de commenter !!</em></h3>
                                                                </div>
                                                            </div>
                                                            <input type="submit" value="Evaluer" class="btn btn-outline-info my-2 border-0 font-size-16 font-gilroy-bold" id="CommentBtn" disabled>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        
                    </div>
                    
                </div>
                <!-- !Rating statics -->

                <!-- Commentaires -->
                <div class="container mt-3" id="Commentaires">
                    <div class="border d-flex justify-content-center py-2">
                        <span class="font-size-20 font-gilroy-bold color-second">Commentaires</span>
                    </div>

                    <c:if test="${comments.isEmpty() || comments == null }">
                        <div class="row">
                            <div class="col-lg-12">
                                <img src="<c:url value="/inc/images/noCommentPic.png"></c:url>" class="center" width="200px">
                                <h5 style="text-align: center;">Aucun commentaire !</h5>
                            </div>
                        </div>
                    </c:if>

                   <c:forEach var="commentaire" items="${comments}">
                       <!-- Element -->
                       <div class="card comment-card mt-2">
                           <div class="user-card card-body">
                               <div class="row">
                                   <div class="col-6">
                                       <h6 class="card-title mb-2 text-muted">${commentaire.getUser().getFirstname()} ${commentaire.getUser().getLastname()}</h6>
                                   </div>

                                   <!-- <div class="col-6 text-right">
                                       <div class="rating text-warning font-size-14">
                                           <span><i class="fas fa-star"></i></span>
                                           <span><i class="fas fa-star"></i></span>
                                           <span><i class="fas fa-star"></i></span>
                                           <span><i class="fas fa-star"></i></span>
                                           <span><i class="far fa-star"></i></span>
                                       </div>
                                   </div> -->
                                   	
                                    <c:set var="nbrEtoileUser" value="${ ratingImpl.getNumberOfEtoileByUserAndHopital(commentaire.getUser(), commentaire.getHopital()) != null ? ratingImpl.getNumberOfEtoileByUserAndHopital(commentaire.getUser(), commentaire.getHopital()) : Long.valueOf(0) }"></c:set>
    								<c:set var="resultUser" value="${ 5 - nbrEtoileUser }"></c:set>
                                    <div class="col-6 text-right">
                                        <div class="rating text-warning font-size-14">
                                            <c:forEach var="counter" begin="1" end="${ nbrEtoileUser }">
                                            	<span><i class="fas fa-star"></i></span>
                                            </c:forEach>
                                            <c:forEach var="counr" begin="1" end="${ resultUser }">
	                                           	<span><i class="far fa-star"></i></span>
                                            </c:forEach>
                                        </div>
                                    </div>
                               </div>
                            
                               <p class="user_comment card-text"> ${commentaire.getCommentaire()} </p>
                           </div>
                       </div>
                       <!-- !Element -->
                   </c:forEach>
                    
                    <div class="border d-flex justify-content-center mt-2" id="moreCommentsBtn" style="visibility: hidden;">
                        <a id="show-more-comments" class="btn font-size-16 font-gilroy-bold color-second">Afficher plus de commentaires</a>
                    </div>

                </div>
                <!-- !Commentaires -->

            </div>
        </div>
        <!-- !Evaluation -->

        <!-- Docteurs -->
        <div class="row py-3" id="Docteurs">
            <div class="container py-5">
                <div class="pt-5 pb-2 border-bottom border-info">
                    <h3 class="container text-left font-gilroy-bold color-primary">Docteurs</h3>
                </div>

                <!-- Docteurs -->
                <div class="mt-5 text-center justify-content-center" id="Docteurs">
                    <div class="container">
                        <div class="row">
                            <c:if test="${docteurs.isEmpty() || docteurs == null }">
                                <div class="col-lg-12">
                                    <img src="<c:url value="/inc/images/noDoctorPic.png"></c:url>" class="center" width="200px">
                                    <h5 style="text-align: center;">Aucun docteur !</h5>
                                </div>
                            </c:if>

                            <c:if test="${!docteurs.isEmpty() }">
                            	<!-- Element-->
	                            <c:forEach var="docteur" items="${docteurs}">
	                                <div class="col-md-3 doctor_card">
	                                    <a href="" class="btn btn-fluid text-center">
	                                        <div class="card">
	                                            <div class="text-center justify-content-center mt-2">
	                                                <img id="item_img" src="data:image/png;base64,${docteurImpl.getImageAsString(docteur)}" width="150 px" class="img-fluid img-responsive border border-3 rounded">
	                                            </div>
	                                            <div class="card-body">
	                                                <h5 class="card-title font-gilroy-bold color-primary">Dr. <span class="DoctorName"> ${docteur.firstname} </span></h5>
	                                                <span class="font-montserrat font-size-12">Spécialité : <span class="font-size-14 font-gilroy-bold"> ${docteur.speciality}</span></span><br>
	                                            </div>
	                                        </div>
	                                    </a>
	                                </div>
	                            </c:forEach>
	                            <!-- !Element-->  
                            </c:if>                   
                            
                            <div class="border d-flex justify-content-center mt-2" id="moredoctorsBtn" style="visibility: hidden;width: 100%;">
                                <a id="show-more-doctors" class="btn font-size-16 font-gilroy-bold color-second">Afficher plus de docteurs</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- !Docteurs -->

            </div>
        </div>
        <!-- !Docteurs -->

    </section>

    <c:import url="/FrontEnd/footer.jsp"></c:import>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    <!--  isotope plugin cdn  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.min.js" integrity="sha256-CBrpuqrMhXwcLLUd5tvQ4euBHCdh7wGlDfNz8vbu/iI=" crossorigin="anonymous"></script>

    <!-- Custom Javascript -->
    <script src="<c:url value="/HospitalProfile/JSIndex.js"/>"></script>

    <!-- font awesome Kit -->
    <script src="https://kit.fontawesome.com/bcf0cddf32.js" crossorigin="anonymous"></script>
</body>
</html>