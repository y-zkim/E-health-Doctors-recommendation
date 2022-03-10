<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>

    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- Font Icon -->
    <link rel="stylesheet" href="<c:url value="/DoctorSearch/node_modules/flag-icon-css/css/flag-icon.css" />">
    <link rel="stylesheet" href="<c:url value="/DoctorSearch/node_modules/flag-icon-css/css/flag-icon.min.css" />">

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

    <!-- Google API-->
    <script defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcybDNa2i9CePsLK9l7rAhcAafXMGALcY&libraries=places&callback=initHospitalMap">
    </script>

    <!-- Custom CSS file -->
    <link rel="stylesheet" href="<c:url value="/DoctorSearch/style.css" />">
</head>
<body onload="initialize()">

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

    <section class="pb-3" id="doctorSearchList">

        <form method="get" action="<c:url value="searchDoctor"></c:url>" >
	        <div class="color-primary-bg py-3">
	            <div class="container py-2">
	                <div class="row font-montserrat font-size-20" align="center" style="font-weight: bold;">
	                    <div class="col-lg-2" style="color: white;">Localisation : </div>
	                    <div class="col-lg-10 input-group">
	                        <input id="autocomplete" class="form-control py-2 border-right-0 border" name="localisation" value="${adresse }" placeholder="Localisation">
	                        <span class="input-group-append" style="background-color: white;">
	                          <button type="submit" class="btn btn-outline-info border-left-0 border" >
	                                <i class="fa fa-search"></i>
	                          </button>
	                        </span>
	                    </div>
	                </div>
	            </div>
	        </div>
	     </form>

        <div class="container container-fluid">
            <div class="row">
                <div class=" col-6 "><h3 class="container text-left font-gilroy mt-3">Docteurs</h3></div>
                <div class="col-6 navbar-header text-right">
                    <button type="button" class="btn show-mobile font-size-20 mt-2 font-gilroy-bold color-second text-right" id="showSearchBarBtn" data-target="#search_bar">
                        <i class="fas fa-bars"></i>                      
                    </button>
                </div>
                
            </div>
            
    
            <!-- Doctor card-->
            <div class="container border-top row flex-column-reverse flex-lg-row">
                <!--Doctors List -->
                <div class="col-lg-8" id="doctors_list">

					<c:if test="${doctors != null }">
						<c:forEach var="entry" items="${doctors}">
	                    	<c:set var="fullname" value="${doctors.getOrDefault(entry.key, entry.value).get(0)}"></c:set>
	                    	<c:set var="speciality" value="${doctors.getOrDefault(entry.key, entry.value).get(1)}"></c:set>
	                    	<c:set var="adress" value="${doctors.getOrDefault(entry.key, entry.value).get(2)}"></c:set>
	                    	<c:set var="gender" value="${doctors.getOrDefault(entry.key, entry.value).get(3)}"></c:set>
	                    	<c:set var="langues" value="${doctors.getOrDefault(entry.key, entry.value).get(4)}"></c:set>
	                    	<c:set var="numberOfRating" value="${doctors.getOrDefault(entry.key, entry.value).get(5)}"></c:set>
	                    	<c:set var="telemedcine" value="${doctors.getOrDefault(entry.key, entry.value).get(6)}"></c:set>
	                    	<c:set var="adomicile" value="${doctors.getOrDefault(entry.key, entry.value).get(7)}"></c:set>
	                    	<c:set var="rating" value="${doctors.getOrDefault(entry.key, entry.value).get(8)}"></c:set>
	                    	<c:set var="average" value="${Integer.valueOf(doctors.getOrDefault(entry.key, entry.value).get(10))}"></c:set>
	                    	<c:set var="specialityClass" value="${doctors.getOrDefault(entry.key, entry.value).get(11)}"></c:set>
	                    	<c:set var="HF" value="${doctors.getOrDefault(entry.key, entry.value).get(13)}"></c:set>
	                    	<c:set var="HD" value="${doctors.getOrDefault(entry.key, entry.value).get(12)}"></c:set>
	                    	<c:set var="JD" value="${doctors.getOrDefault(entry.key, entry.value).get(14)}"></c:set>
	                    	<c:set var="JF" value="${doctors.getOrDefault(entry.key, entry.value).get(15)}"></c:set>
	                    	<c:set var="image" value="${doctors.getOrDefault(entry.key, entry.value).get(16)}"></c:set>
	                    	<c:set var="ID" value="${Long.valueOf(doctors.getOrDefault(entry.key, entry.value).get(17))}"></c:set>
	                    	<c:set var="docteur" value="${docteurDao.getById(ID)}"></c:set>
	                    	
	                    	<div class="item ${specialityClass} ${rating} ${gender} ${telemedcine} ${adomicile} ${langues}">
		                        <div class="row border py-3 mt-3">
		                            <div class="col-md-3 text-xs-center">
		                                <img src="data:image/png;base64,${image}" width="150 px" alt="cart1" class="img-fluid img-responsive">
		                            </div>
		        
		                            <div class="col-md-9 text-xs-center">
		                                <div>
		                                    <div class="border-bottom">
		                                        <h4>
			                                        <a href="<c:url value="/doctorProfile?docteur=${ID }"></c:url>"" class="font-gilroy text-danger ">
			                                        	Dr. <span class="fullName"> ${fullname}</span>
		                                        	</a>
	                                        	</h4>
		                                    </div>
		                                </div>
		    
		                                <div class="row mt-3">
		                                    <div class="col-md-6">
		                                        <span class="font-montserrat font-size-14">Spécialité : <span class="color-second"> ${speciality} </span></span>
		                                        <div class="rating text-warning font-size-12">
		                                        	<c:set var="numberOfRating" value="${average}"></c:set>
		                                            <c:choose>
		                                            	<c:when test="${numberOfRating == 0 }">
		                                            		<span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
		                                            	</c:when>
		                                            	<c:when test="${numberOfRating == 1 }">
		                                            		<span><i class="fas fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
		                                            	</c:when>
		                                            	<c:when test="${numberOfRating == 2 }">
		                                            		<span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
		                                            	</c:when>
		                                            	<c:when test="${numberOfRating == 3 }">
		                                            		<span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
		                                            	</c:when>
		                                            	<c:when test="${numberOfRating == 4 }">
		                                            		<span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="far fa-star"></i></span>
		                                            	</c:when>
		                                            	<c:when test="${numberOfRating == 5 }">
		                                            		<span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
				                                            <span><i class="fas fa-star"></i></span>
		                                            	</c:when>
		                                            </c:choose>
		                                            
		                                            
		                                            <span class="color-primary">${numberOfRating} votes</span>
		                                        </div>
		                                    </div>
		                                    <div class="col-md-6 border-left">
		                                        <span class="font-noto text-secondary font-size-12"><i class="fas fa-calendar-alt"></i> ${HD}-${HF} - ${JD} a ${JF}</span><br>
		                                        <c:if test=" ${adress != null} ">
		                                        	<span class="font-noto text-secondary font-size-12"><i class="fas fa-map-marker-alt"></i> ${adress}</span>
		                                        </c:if>     
		                                        <c:if test="${adress == null}">
		                                        	<span class="font-noto text-secondary font-size-12"><i class="fas fa-map-marker-alt"></i> Agadir </span><br>
		                                        </c:if>                               
		                                    </div>
		                                </div>
		    
		                                <div class="mt-3 py-1 border-top">
		                                    <div class="row">
		                                        <!-- if 3ndo telemedecine-->
		                                        <c:if test="${ docteur.teleMedcine }">
		                                        	<span class="col-md-6 font-size-12 text-dark font-montserrat"><i class="fas fa-mobile-alt text-success"></i> &nbsp; Telemedecin</span>
		                                        </c:if>
		                                        <c:if test="${ docteur.consultationDomicile }">
		                                        	<span class="col-md-6 font-size-12 text-dark font-montserrat"><i class="fas fa-home text-success"></i> &nbsp; Consultation a domicile</span>
		                                        </c:if>
		                                        
		                                    </div>
		                                    
		                                </div>
		                            </div>
		                        </div>
		                    </div>
	                    </c:forEach>
					</c:if>
					<c:if test="${doctors == null}">
						<br>
                        <img src="<c:url value="/inc/images/noDoctorPic.png"></c:url>" class="center" width="200px"></td>
                        <h5 style="text-align: center;">Aucun Docteur !</h5>
                    </c:if>
                    
                </div>
    
                <!--Search bar -->
                
                <div class="col-lg-4 order-lg-1 mt-3 button-group" id="search_bar">

                    <!-- Clear Button -->
                    <div class="Clear border d-flex justify-content-center mb-3">
                        <button class="btn font-size-16 font-gilroy-bold color-second" id="clearAllBtn">Réinitialiser la recherche</button>
                    </div>
                    
                    <!-- Name -->
                    <div class="Name border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Nom</h6>
                        <div class="pl-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="row input-group">
                                    <input class="col-2 form-control" value="Dr.">
                                    <input class="form-control py-2 border-right-0 border-left-0 border" id="NameInput" oninput="filter()">
                                    <span class="input-group-append">
                                      <button class="btn btn-outline-secondary border-left-0 border" type="button">
                                            <i class="fa fa-search"></i>
                                      </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Special services -->
                    <div class="special_services border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Sévices Spécial</h6>
                        <div class="px-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Télémédecine" id="Telemedecine" name="Sevices_Special" onclick="filter()" checked>
                                    <label class="form-check-label" for="special_services">
                                        Télémédecine
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Consultation à domicile" id="Consultation_a_domicile" name="Sevices_Special" onclick="filter()" checked>
                                    <label class="form-check-label" for="special_services">
                                        Consultation à domicile
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Rating -->
                    <div class="Rating border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Évaluation des visiteurs</h6>
                        <div class="px-4 py-2">
                            <div class="font-montserrat font-size-14">

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="Tous" id="Tous" onclick="filter()" checked>
                                    <label class="form-check-label" for="stars">
                                        Tous
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_5" id="stars_5" onclick="filter()">
                                    <label class="form-check-label" for="stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_4" id="stars_4" onclick="filter()">
                                    <label class="form-check-label" for="stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_3" id="stars_3" onclick="filter()">
                                    <label class="form-check-label" for="stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>
                                
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_2" id="stars_2" onclick="filter()">
                                    <label class="form-check-label" for=stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>
                                
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_1" id="stars_1" onclick="filter()">
                                    <label class="form-check-label" for=stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_0" id="stars_0" onclick="filter()">
                                    <label class="form-check-label" for="stars">
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                    <!-- Speciality -->
                    <div class="Speciality border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Spécialités</h6>
                        <div class="px-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Tous" name="Speciality" id="Tous" onclick="filter()" checked>
                                    <label class="form-check-label" for="Speciality">
                                        Tous
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Chirurgie esth�tique" name="Speciality" id="Chirurgie_esthetique" onclick="filter()">
                                    <label class="form-check-label" for="Speciality">
                                        Chirurgie esthétique
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Chirurgie p�diatrique" name="Speciality" id="Chirurgie_pediatrique" onclick="filter()">
                                    <label class="form-check-label" for="Speciality">
                                        Chirurgie pédiatrique
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Chirurgie vasculaire" name="Speciality" id="Chirurgie_vasculaire" onclick="filter()">
                                    <label class="form-check-label" for="Speciality">
                                        Chirurgie vasculaire
                                    </label>
                                </div>

                                <div id="showMore" style="display: none;">
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Chirurgie visc�rale et digestive" name="Speciality" id="Chirurgie_visc�rale_et_digestive" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Chirurgie viscérale et digestive
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Gyn�cologie obst�trique" name="Speciality" id="Gynecologie_obstetrique" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Gynécologie obstétrique
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Neurochirurgie" name="Speciality" id="Neurochirurgie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Neurochirurgie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Allergologie" name="Speciality" id="Allergologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Allergologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Anatomie et cytologie pathologique" name="Speciality" id="Anatomie_et_cytologie_pathologique" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Anatomie et cytologie pathologique
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Anesth�sie" name="Speciality" id="Anesthesie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Anesthésie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Cardiologie" name="Speciality" id="Cardiologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Cardiologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Dermatologie" name="Speciality" id="Dermatologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Dermatologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Endocrinologie-nutrition" name="Speciality" id="Endocrinologie-nutrition" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Endocrinologie-nutrition
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="G�n�tique" name="Speciality" id="Genetique" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Génétique
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Allergologie" name="Speciality" id="Allergologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Allergologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Gyn�cologie m�dicale" name="Speciality" id="Gynecologie_medicale" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Gynécologie médicale
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="H�matologie" name="Speciality" id="Hematologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Hématologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="M�decine g�n�rale" name="Speciality" id="Medecine_generale" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Médecine générale
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="M�decine physique et r�adaptation" name="Speciality" id="Medecine_physique_et_readaptation" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Médecine physique et réadaptation
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="N�phrologie" name="Speciality" id="Nephrologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Néphrologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Neurologie" name="Speciality" id="Neurologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Neurologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Psychiatrie" name="Speciality" id="Psychiatrie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Psychiatrie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Radiologie" name="Speciality" id="Radiologie" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Radiologie
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="R�animation" name="Speciality" id="Reanimation" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                           Réanimation
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Sant� publique" name="Speciality" id="Sante_publique" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Santé publique
                                        </label>
                                    </div>
                                    
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" value="Urgentiste" name="Speciality" id="Urgentiste" onclick="filter()">
                                        <label class="form-check-label" for="Speciality">
                                            Urgentiste
                                        </label>
                                    </div>
                                </div>

                                <button class="btn font-size-12 btn-link" id="showMoreBtn">Afficher plus</button>
                            </div>
                        </div>
                    </div>

                    <!-- Language -->
                    <div class="Language border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Langues</h6>
                        <div class="px-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Tous" id="Tous" name="Language" onclick="filter()" checked>
                                    <label class="form-check-label" for="Language">
                                        <i class="fas fa-globe-europe font-size-16"></i> Tous
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="English" id="English" name="Language" onclick="filter()">
                                    <label class="form-check-label" for="Language">
                                        <span class="flag-icon flag-icon-us"></span> Anglais
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Espanol" id="Espanol" name="Language" onclick="filter()">
                                    <label class="form-check-label" for="Language">
                                        <span class="flag-icon flag-icon-mx"></span> Espanol
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Chinois" id="Chinois" name="Language" onclick="filter()">
                                    <label class="form-check-label" for="Language">
                                        <span class="flag-icon flag-icon-cn"></span> Chinois
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Frensh" id="Frensh" name="Language" onclick="filter()">
                                    <label class="form-check-label" for="Language">
                                        <span class="flag-icon flag-icon-fr"></span> Francais
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Arabic" id="Arabic" name="Language" onclick="filter()">
                                    <label class="form-check-label" for="Language">
                                        <span class="flag-icon flag-icon-ma"></span> Arabic
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Gender -->
                    <div class="Gender border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Sexe</h6>
                        <div class="px-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" value="Tous" id="Tous" onclick="filter()" checked>
                                    <label class="form-check-label" for="gender">
                                        Tous
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" value="Homme" id="Homme" onclick="filter()">
                                    <label class="form-check-label" for="gender">
                                        Homme
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="gender" value="Femme" id="Femme" onclick="filter()">
                                    <label class="form-check-label" for="gender">
                                        Femme
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Disponibility -->
                    <div class="Disponibility border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Disponibilité</h6>
                        <div class="px-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Aujourd'hui" id="Disponibility" >
                                    <label class="form-check-label" for="Disponibility">
                                        Aujourd'hui
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Consultation à domicile" id="Disponibility" >
                                    <label class="form-check-label" for="Disponibility">
                                        Demain
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Consultation à domicile" id="Disponibility" >
                                    <label class="form-check-label" for="Disponibility">
                                        Cette semaine
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="Consultation à domicile" id="Disponibility" >
                                    <label class="form-check-label" for="Disponibility">
                                        La semaine prochaine
                                    </label>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
    
            </div>
            
        </div>
    </section>

    <c:import url="/FrontEnd/footer.jsp"></c:import>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- Owl Carousel Js file -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha256-pTxD+DSzIwmwhOqTFN+DB+nHjO4iAsbgfyFq5K5bcE0=" crossorigin="anonymous"></script>

    <!--  isotope plugin cdn  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.min.js" integrity="sha256-CBrpuqrMhXwcLLUd5tvQ4euBHCdh7wGlDfNz8vbu/iI=" crossorigin="anonymous"></script>

    <!-- Custom Javascript -->
    <script src="<c:url value="/DoctorSearch/JSIndex.js" />"></script>

    <!-- font awesome Kit -->
    <script src="https://kit.fontawesome.com/bcf0cddf32.js" crossorigin="anonymous"></script>
</body>
</html>