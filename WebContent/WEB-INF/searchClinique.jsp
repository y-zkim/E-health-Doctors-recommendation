<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Cliniques</title>

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
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/searchClinique/pageLogo.png"></c:url>" />

    <!-- Google API-->
    <script defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDcybDNa2i9CePsLK9l7rAhcAafXMGALcY&libraries=places&callback=initHospitalMap">
    </script>

    <!-- Custom CSS file -->
    <link rel="stylesheet" href="<c:url value="/searchClinique/style.css"></c:url>">
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

        <form method="get" action="<c:url value="/searchClinique"></c:url>">
        	<div class="color-primary-bg py-3">
            <div class="container py-2">
                <div class="row font-montserrat font-size-20" align="center" style="font-weight: bold;">
                    <div class="col-lg-2" style="color: white;">Localisation : </div>
                    <div class="col-lg-10 input-group">
                        <input id="autocomplete" name="adresse" class="form-control py-2 border-right-0 border" value="${adresse}" placeholder="Localisation">
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
                <div class=" col-6 "><h3 class="container text-left font-gilroy-bold mt-3">Cliniques</h3></div>
                <div class="col-6 navbar-header text-right">
                    <button type="button" class="btn show-mobile font-size-20 mt-2 font-gilroy-bold color-second text-right" id="showSearchBarBtn" data-target="#search_bar">
                        <i class="fas fa-bars"></i>                      
                    </button>
                </div>
                
            </div>
            
    
            <!-- hopitaux card-->
            <div class="container border-top row flex-column-reverse flex-lg-row">
                <!--hopitaux List -->
                <div class="col-lg-7" id="hopitaux_list">

                    <c:if test="${cliniques != null }">
                    	<c:forEach var="entry" items="${cliniques}">
	                        <!-- Element -->
	                        <c:set var="nbr" value="${impl.getAverageOfRating(entry.cin,\"idClinique\")}"></c:set>
	                        <c:set var="result" value="${ 5 - nbr}"></c:set>
	                        <div class="item stars_${nbr}">
	                            <div class="row border py-3 mt-3">
	                                <div class="col-md-2 text-center">
	    
	                                    <div class="row text-center justify-content-center">
	                                        <i class="fas fa-hospital fa-3x mx-1 my-1 color-second text-center"></i>
	                                    </div>
	                                    
	                                    
	                                    <div class="row text-center justify-content-center">
	                                        <div class="rating font-size-12 mt-2 text-warning">
	                                            <c:forEach var="e" begin="1" end="${nbr}">
	                                                <span><i class="fas fa-star"></i></span>    
	                                            </c:forEach>
	                                            <c:forEach var="e" begin="1" end="${result}">
	                                                <span><i class="far fa-star"></i></span>
	                                            </c:forEach>
	                                            <!-- Math.around() -->
	                                            <br><span class="font-gilroy-bold text-dark">${impl.getNumberOfRating(entry.cin, "idClinique")} votes</span><br>
	                                        </div>
	                                    </div>
	    
	                                </div>
	            
	                                <div class="col-md-10 text-xs-center justify-content-center">
	                                    <div class="border-bottom">
	                                        <a href="<c:url value="/CliniqueProfile?idd=${entry.cin}"></c:url>" class="btn"><h4 class="font-gilroy-bold color-primary fullName">${entry.name}</h4></a>
	                                    </div>
	                                    <table>
	                                        <tr style="width:100%">
	                                            <td style="width:90%; text-align: left;"><span class="font-noto text-secondary font-size-14 ml-3"><i class="fas fa-map-marker-alt text-danger"></i> ${entry.adresse}</span></td>
	                                            <td style="width:10%"><a href="" target="_blank" class="btn btn-fluid font-size-12 btn-outline-info direction_anchor">Direction</a></td>
	                                        </tr>
	                                    </table>
	                                </div>
	                                <span class="place_id" hidden>${entry.id}</span><br>
	                            </div>
	                        </div>
	                        <!-- !Element -->
	                    </c:forEach>
                    </c:if>
					<c:if test="${cliniques == null}">
						<br>
                        <img src="<c:url value="/inc/images/noClinicPic.png"></c:url>" class="center" width="200px"></td>
                        <h5 style="text-align: center;">Aucun Clinique !</h5>
                    </c:if>
                </div>
    
                <!--Search bar -->
                
                <div class="col-lg-5 order-lg-1 mt-3 button-group" id="search_bar">

                    <!-- Map -->
                    <div class="Map border mb-3">
                        <h6 class="font-size-16 font-gilroy-bold color-second px-4 mt-2">Map</h6>
                        <div id="map" class="z-depth-1-half map-container my-2 mx-2"></div>
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
                                    <input class="form-control py-2 border-right-0 border" id="NameInput" oninput="filterHospitals()">
                                    <span class="input-group-append">
                                      <button class="btn btn-outline-secondary border-left-0 border" type="button">
                                            <i class="fa fa-search"></i>
                                      </button>
                                    </span>
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
                                    <input class="form-check-input" type="radio" name="rating" value="Tous" id="Tous" onclick="filterHospitals()" checked>
                                    <label class="form-check-label" for="stars">
                                        Tous
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_5" id="stars_5" onclick="filterHospitals()">
                                    <label class="form-check-label" for="stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_4" id="stars_4" onclick="filterHospitals()">
                                    <label class="form-check-label" for="stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_3" id="stars_3" onclick="filterHospitals()">
                                    <label class="form-check-label" for="stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>
                                
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_2" id="stars_2" onclick="filterHospitals()">
                                    <label class="form-check-label" for=stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>
                                
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_1" id="stars_1" onclick="filterHospitals()">
                                    <label class="form-check-label" for=stars">
                                        <span class="text-warning"><i class="fas fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                        <span class="text-warning"><i class="far fa-star"></i></span>
                                    </label>
                                </div>

                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="rating" value="stars_0" id="stars_0" onclick="filterHospitals()">
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
    <script src="<c:url value="/searchClinique/JSIndex.js"></c:url>"></script>

    <!-- font awesome Kit -->
    <script src="https://kit.fontawesome.com/bcf0cddf32.js" crossorigin="anonymous"></script>
</body>
</html>