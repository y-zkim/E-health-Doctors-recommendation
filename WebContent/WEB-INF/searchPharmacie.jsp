<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Pharmacies</title>

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

    <!-- LOGO -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/searchHospital/pageLogo.png"></c:url>" />

    <!-- Custom CSS file -->
    <link rel="stylesheet" href="<c:url value="/searchPharmacie/style.css" />">
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
		
        <form action="<c:url value="SearchPharmacie" />" method="post">
        	<div class="color-primary-bg py-3">
            <div class="container py-2">
                <div class="row font-montserrat font-size-20" align="center" style="font-weight: bold;">
                    <div class="col-lg-2" style="color: white;">Localisation : </div>
                    <div class="col-lg-10 input-group">
                        <input id="autocomplete" name="ville" class="form-control py-2 border-right-0 border" value="${adresse }" placeholder="Localisation">
                        <span class="input-group-append" style="background-color: white;">
                          <button class="btn btn-outline-info border-left-0 border" type="submit">
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
                <div class=" col-6 "><h3 class="container text-left font-gilroy-bold mt-3">Pharmacies</h3></div>
                <div class="col-6 navbar-header text-right">
                    <button type="button" class="btn show-mobile font-size-20 mt-2 font-gilroy-bold color-second text-right" id="showSearchBarBtn" data-target="#search_bar">
                        <i class="fas fa-bars"></i>                      
                    </button>
                </div>
                
            </div>
            
    
            <!-- Pharmacies card-->
            <div class="container border-top row flex-column-reverse flex-lg-row">
                <!--Pharmacies List -->
                <div class="col-lg-7" id="Pharmacies_list">

                    <c:if test="${ !pharmacies.isEmpty()}">
                    	<c:forEach var="entry" items="${ pharmacies }">
	                    	<c:if test="${entry.en_garde == false}"> 
	                    		<c:set var="permanence" value="jour"></c:set>                   	
	                    	</c:if>
	                    	<c:if test="${entry.en_garde}"> 
	                    		<c:set var="permanence" value="jour_nuit"></c:set>                   	
	                    	</c:if>
	                    	<div class="item ${permanence }">
		                        <div class="row border py-3 mt-3">
		                            <div class="col-md-2 text-center">
		
		                                <div class="row text-center justify-content-center">
		                                    <img id="item_img" src="<c:url value="/searchPharmacie/medicine.png"/>" width="75px" class="img-fluid img-responsive">
		                                </div>
		
		                            </div>
		        
		                            <div class="col-md-10 text-xs-center justify-content-center">
		                                <div class="border-bottom">
		                                    <button class="btn" onclick="showPharmaClicked(event)"><h4 class="font-gilroy-bold font-size-20 color-primary fullName">${ entry.name }</h4></button>
		                                </div>
		                                <table style="width:100%">
		                                    <tr>
		                                        <td style="width:60%; text-align: left; text-align:left; vertical-align:middle"><span class="font-noto text-secondary font-size-14 ml-3"><i class="fas fa-map-marker-alt text-danger"></i> ${entry.adresse} </span></td>
		                                        <td style="width:40%; text-align:right; vertical-align:middle"><a href="" target="_blank" class="btn btn-fluid font-size-12 btn-outline-info direction_anchor">Direction</a></td>
		                                    </tr>
		                                    <tr>
		                                        <td style='text-align:left; vertical-align:middle'>
		                                            <span class="working_time"></span>
		                                        </td>
		
		                                        <td style='text-align:right; vertical-align:middle'>
		                                            <span class="btn btn-info rounded font-size-14 px-3 py-1">
		                                                <i class="fas fa-phone-alt"></i>
		                                                <span class="weight-bold">+212${entry.tel}</span> 
		                                            </span>
		                                        </td>
		                                    </tr>
		                                </table>
		                            </div>
		                            <span class="place_id" hidden>${entry.id}</span><br>
		                        </div>
		                    </div>
	                    </c:forEach> 
                    </c:if>
                    <c:if test="${pharmacies.isEmpty() }">
						<br>
                        <img src="<c:url value="/inc/images/noPharmaPic.png"></c:url>" class="center" width="200px"></td>
                        <h5 style="text-align: center;">Aucun Pharmacie !</h5>
                    </c:if>                   
                </div>
    
                <!--Search bar -->
                
                <div class="col-lg-5 order-lg-1 mt-3 button-group" id="search_bar">

                    <!-- Map -->
                    <div class="Map border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Map</h6>
                        <div id="map" class="z-depth-1-half map-container my-2 mx-2"></div>
                        <div class="container my-2 ">

                            <div class="row mx-2">
                                <div class="col-xs-2">
                                    <img src="<c:url value="/searchPharmacie/geo_green.png"/>" alt="geo_green" width="16px">
                                </div>
                                <div class="col-xs-10">
                                    <span class="text-success">&nbsp; Ouvert toute la journée</span>
                                </div>
                            </div>

                            <div class="row mx-2">
                                <div class="col-xs-2">
                                    <img src="<c:url value="/searchPharmacie/geo_blue.png"/>" alt="geo_blue" width="16px">
                                </div>
                                <div class="col-xs-10">
                                    <span class="text-info">&nbsp; Ouvert seulement le jour</span>
                                </div>
                            </div>

                           

                        </div>
                    </div>

                    <!-- Clear Button -->
                    <div class="Clear border d-flex justify-content-center mb-3">
                        <button class="btn font-size-16 font-gilroy-bold color-second" id="clearHospitalsBtn">Réinitialiser la recherche</button>
                    </div>
                    
                    <!-- Name -->
                    <div class="Name border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Nom</h6>
                        <div class="pl-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="row input-group">
                                    <input class="form-control py-2 border-right-0 border" id="NameInput" oninput="filterPharmacies()">
                                    <span class="input-group-append">
                                      <button class="btn btn-outline-secondary border-left-0 border" type="button">
                                            <i class="fa fa-search"></i>
                                      </button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Working times -->
                    <div class="working_times border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Temps de travail</h6>
                        <div class="px-4 py-2">
                            <div class="font-montserrat font-size-14">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Tous" id="Tous" name="working_time" onclick="filterPharmacies()" checked>
                                    <label class="form-check-label" for="working_time">
                                        Tous
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Ouvert toute la journée" id="jour_nuit" name="working_time" onclick="filterPharmacies()">
                                    <label class="form-check-label" for="working_time">
                                        Ouvert toute la journée
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="Ouvert seulement le jour" id="jour" name="working_time" onclick="filterPharmacies()">
                                    <label class="form-check-label" for="working_time">
                                        Ouvert seulement le jour
                                    </label>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
    
            </div>
            
        </div>
    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!-- Owl Carousel Js file -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha256-pTxD+DSzIwmwhOqTFN+DB+nHjO4iAsbgfyFq5K5bcE0=" crossorigin="anonymous"></script>

	<!-- Google API-->
    <script defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcybDNa2i9CePsLK9l7rAhcAafXMGALcY&libraries=places&callback=initPharmacyMap">
    </script>
    
    <!--  isotope plugin cdn  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/3.0.6/isotope.pkgd.min.js" integrity="sha256-CBrpuqrMhXwcLLUd5tvQ4euBHCdh7wGlDfNz8vbu/iI=" crossorigin="anonymous"></script>

    <!-- Custom Javascript -->
    <script src="<c:url value="/searchPharmacie/JSIndex.js"/>"></script>

    <c:import url="/FrontEnd/footer.jsp"></c:import>

    <!-- font awesome Kit -->
    <script src="https://kit.fontawesome.com/bcf0cddf32.js" crossorigin="anonymous"></script>
</body>
</html>