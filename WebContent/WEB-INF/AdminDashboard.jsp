<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>${sessionScope.admin.firstname} ${sessionScope.admin.lastname}</title>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/assets/css/dashboard.css" />" >

    <!-- LOGO -->
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/inc/images/pageLogo.png" />" />

    <!-- toggle button -->
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- toggle button -->
</head>
<body>
        <input type="checkbox" id="nav-toggle">

        <div class="sidebar">
            <div class="sidebar-brand">
                <img src="<c:url value="/inc/images/whiteEHealthLogo.png"></c:url>" width="250px">
            </div>
            <div class="sidebar-menu">
                <ul>
                
                    <li>
                        <a href="#" class="buttons dash" onclick="handleClick(event, 'profile')">
                            <img id="adm" src="https://img.icons8.com/windows/24/ffffff/change-user-male--v1.png" style="padding-right:12px"/>
                            <span>Admin Profile</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="buttons active" onclick="handleClick(event, 'dashboard')">
                            
                            <span class="las la-igloo"></span>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="buttons dash" id="demmandes_sidebar" onClick="handleClick(event, 'Demmandes')">
                            
                            <span class="las la-clipboard-list"></span>
                            <span>Demandes</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="#" class="buttons btn-comment" id="btn-comment"  onclick="handleClick(event, 'comments_Section')">
                            <img id="cmt" src="https://img.icons8.com/metro/24/ffffff/comments.png" style="padding-right:12px"/>
                            <span>Commentaires</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="buttons dash"  onclick="handleClick(event, 'doctors_Section')">
                            <span class="las la-stream"></span>
                            <span>Docteurs</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="buttons dash"  onclick="handleClick(event, 'cliniques_Section')">
                            <span class="las la-stream"></span>
                            <span>Clinique</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="buttons dash"  onclick="handleClick(event, 'pharmacies_Section')">
                            <span class="las la-stream"></span>
                            <span>Pharmacies</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="buttons dash"  onclick="handleClick(event, 'hospitals_Section')">
                            <span class="las la-stream"></span>
                            <span>Hopitaux</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" id="pharmaBtn" class="buttons dash" onClick="handleClick(event, 'pharmacy')">
                            
                            <img id="phar" src="https://img.icons8.com/pastel-glyph/24/ffffff/hand-with-a-pill.png"  style="padding-right:12px"/>
                            <span>Nauvelle pharmacie</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" id="hospBtn" class="buttons dash" onClick="handleClick(event, 'hospital')">
                            
                            <img id="hos" src="https://img.icons8.com/material/24/ffffff/hospital-2.png"  style="padding-right:12px"/>
                            <span>Nouvel hopital</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" id="hospBtn" class="buttons dash" onClick="handleClick(event, 'new_admin')">
                            
                            <img id="hos" src="https://img.icons8.com/material/24/ffffff/hospital-2.png"  style="padding-right:12px"/>
                            <span>Nouveau admin</span>
                        </a>
                    </li>
                    <br>
                    <li>
                        <a href="<c:url value="Deconnexion"></c:url>" class="buttons dash" >
                            <span class="las la-door-open"></span>
                            <span>Déconnexion</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="main-content">
            <header>
                <div class="header-title" style="float:left">
                    <h2>
                        <label for="nav-toggle">
                            <span class="las la-bars"></span>
                        </label>
                        Dashboard
                    </h2>
                </div>

                <div class="user-wrapper" style="float:right">
                    <img src="https://bootdey.com/img/Content/avatar/avatar7.png" width="40px" height="40px" alt="">
                    <div class="user-wrapper-info">
                        <h4>${sessionScope.admin.firstname} ${sessionScope.admin.lastname}</h4>
                        <small>super admin</small>
                    </div>
                </div>
            </header>

            <!-- profile -->
            <main  id="profile" class="hide slideBar_main">
                <div class="profile">
                    <div class="profile_section_part1">
                        <div class="card-profile" style="border:5px solid green;width:200px;height: 300px;">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                                <div class="mt-3">
                                    <h4> ${sessionScope.admin.firstname} ${sessionScope.admin.lastname}</h4>
                                    <p class="text-secondary mb-1">super admin</p>
                                    <!-- <p class="text-muted font-size-sm">Agadir,salam</p> -->
                                </div>
                            </div>
                        </div>
        
                        <div class="card-profile">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Full Name</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${sessionScope.admin.firstname} ${sessionScope.admin.lastname}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${sessionScope.admin.email}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                <h6 class="mb-0">Phone</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${sessionScope.admin.tel}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                <h6 class="mb-0">Role</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                Administrateur
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-form">
                        <form method="POST" action="<c:url value="AdminProfile"></c:url>">
                            <div class="form-group" style="display: none;">
                                <label for="exampleInputEmail1">ID</label>
                                <input type="text" name="id" value="${sessionScope.admin.cin}" class="form-control" id="exampleInputEmail1" placeholder="id">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" name="email" value="${sessionScope.admin.email}" class="form-control" id="exampleInputEmail1" placeholder="Email">
                            </div>
                                <div class="form-group">
                                <label for="exampleInputEmail1">Phone</label>
                                <input type="text" name="tel" value="${sessionScope.admin.tel}" class="form-control" id="exampleInputPhone" placeholder="Phone Number">
                            </div>
                            <div class="form-group">
                                <label for="ancien">Ancien mot de pass</label>
                                <input type="password" name="acien_pass" class="form-control" id="ancien" placeholder="Ancien mot de pass">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Nouveau Password</label>
                                <input type="password" name="nv_pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword2">Confirmation password</label>
                                <input type="password" name="confirmation_password" class="form-control" id="exampleInputPassword2" placeholder="Password">
                            </div>
                            <button type="submit">Submit</button>
                        </form>   
                    </div>
                </div>   
            </main>
            <!-- profile -->

            <!-- Dashboard -->
            <main id="dashboard" class="slideBar_main" >

                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1>${nbrUsers}</h1>
                            <span>Users</span>
                        </div>
                        <div class="dashboard_icon">
                            <span class="las la-users"></span>
                        </div>
                    </div>

                    <div class="card-single">
                        <div>
                            <h1>${nbrDoctors}</h1>
                            <span>Doctors</span>
                        </div>
                        <div class="dashboard_icon">
                            <img src="https://img.icons8.com/ios/50/069c54/doctor-male.png"/>                    
                        </div>
                    </div>

                    <div class="card-single">
                        <div>
                            <h1>${nbrClinics}</h1>
                            <span>Clinics</span>
                        </div>
                        <div class="dashboard_icon">
                            <img src="https://img.icons8.com/carbon-copy/60/069c54/clinic.png"/>
                        </div>
                    </div>

                    <div class="card-single">
                        <div>
                            <h1>${nbrPharmacies}</h1>
                            <span>Pharmacies</span>
                        </div>
                        <div class="dashboard_icon">
                            <img src="https://img.icons8.com/pastel-glyph/60/069c54/hand-with-a-pill.png"/>
                        </div>
                    </div>
                </div>

                <div class="recent-grid" >

                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Commentaires</h3>
                                <button onclick="seeAll('btn-comment', 'comments_Section')">Voire tous <span class="las la-arrow-right"></span></button>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <c:if test="${comments == null}">
                                        <img src="<c:url value="/inc/images/greenNoCommentPic.png"></c:url>" class="center" width="200px"></td>
                                        <h5 style="text-align: center;">Pas de commentaires !</h5>
                                    </c:if>

                                    <c:if test="${comments != null}">
                                        <table width="100%">
                                            <thead>
                                                <tr>
                                                    <td>Username</td>
                                                    <td>Commented on</td>
                                                    <td>Etablissement's name</td>
                                                    <td>Comment</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <c:forEach var="entry" items="${comments}">
                                                    <tr>
                                                        <td> ${entry.getUser().getFirstname()} ${entry.getUser().getLastname()}</td>
                                                        <c:if test="${entry.getDocteur() != null}">
                                                            <td>Doctor</td>
                                                            <td>${entry.getDocteur().getFirstname()} ${ entry.getDocteur().getLastname() }</td>
                                                        </c:if>
                                                        <c:if test="${entry.getClinique() != null}">
                                                            <td>Doctor</td>
                                                            <td>${entry.getClinique().getName()} </td>
                                                        </c:if>
                                                        <c:if test="${entry.getHopital() != null}">
                                                            <td>Doctor</td>
                                                            <td>${entry.getHopital().getName()} </td>
                                                        </c:if>
                                                        <td>
                                                            <span class="status orange"></span>
                                                            ${entry.commentaire}
                                                        </td>
                                                    </tr>
                                                </c:forEach>    
                
                                            </tbody>
                                        </table>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="customers">
                        <div class="card">
                            <div class="card-header">
                                <h3>Demandes</h3>
                                <button onclick="seeAll('demmandes_sidebar', 'Demmandes')">Voire tous <span class="las la-arrow-right"></span></button>
                            </div>
                            <div class="card-body">
                                <c:if test="${ docs == null && clinics == null }">
                                    <img src="<c:url value="/inc/images/demmande.png"></c:url>" class="center" width="100px"></td>
                                    <h5 style="text-align: center;">Aucune demande !</h5>
                                </c:if>
                                <c:if test="${ !docs.isEmpty() }">
                                    <c:forEach var="docteur" items="${docs}">
                                        <div class="customer">
                                            <div class="info">
                                                <img src="./assets/img/doc.jpg" width="40px" height="40px" alt="">
                                                <div>
                                                    <h4>${docteur.firstname} ${docteur.lastname}</h4>
                                                    <small>cabinet médical</small>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${ !clinics.isEmpty() }">
                                    <c:forEach var="clinic" items="${clinics }">
                                        <div class="customer">
                                            <div class="info">
                                                <img src="./assets/img/unknown.png" width="40px" height="40px" alt="">
                                                <div>
                                                    <h4>${clinic.name}</h4>
                                                    <small>clinique</small>
                                                </div>
                                            </div>
                                        </div>
                                </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- Dashboard -->
            
            <!-- demandes -->
            <main class="hide slideBar_main" id="Demmandes">
                <div class="demmande-grid">
                    <div class="Dommendes-card">
                        <div class="demmande_card">
                            <div class="card-header">
                                <h3>Demandes de comptes</h3>
                            </div>
                            <div class="demmande-card-body">
                                <c:if test="${!docs.isEmpty()}">
                                    <c:forEach var="doc" items="${docs}" >
                                        <div class="Form">
                                            <div class="info">
                                                <div>
                                                    <h4>${doc.firstname} ${doc.lastname}</h4>
                                                    <small >Docteur</small>
                                                </div>
                                            </div>
                                            <div class="contact">
                                                <a href="<c:url value="/docsInfo?id=${doc.cin}" />" target="_blank" class="viewBtn">Voir la demande</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${!clinics.isEmpty()}">
                                    <c:forEach var="clinic" items="${clinics}">
                                        <div class="Form">
                                            <div class="info">
                                                <div>
                                                    <h4>${clinic.name}</h4>
                                                    <small>Clinique</small>
                                                </div>
                                            </div>
                                            <div class="contact">
                                                <a href="<c:url value="/clinicInfo?id=${clinic.cin}" />" class="viewBtn">Voir la demande</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${clinics == null && docs == null}">
                                    <div class="card">
                                        <div class="card-body">
                                            <img src="<c:url value="/inc/images/demmande.png"></c:url>" class="center" width="200px"></td>
                                            <h3 style="text-align: center;">Aucune demande !</h3>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- demandes -->

            <!-- comment section -->
            <main class="commentsSection hide slideBar_main" id="comments_Section">
                <div class="recent-grid-comments">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Comments</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <c:if test="${comments == null}">
                                        <img src="<c:url value="/inc/images/greenNoCommentPic.png"></c:url>" class="center" width="200px"></td>
                                        <h2 style="text-align: center;">Pas de commentaires !</h2>
                                    </c:if>
                                    <c:if test="${comments != null}">
                                        <table width="100%">
                                            <thead>
                                                <tr>
                                                    <td>Username</td>
                                                    <td>Commented on</td>
                                                    <td>Etablissement's name</td>
                                                    <td>Comment</td>
                                                    <td>Delete</td>
                                                    <td>Approve</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="entry" items="${comments}">
                                                    <tr>
                                                        <td> ${entry.getUser().getFirstname()} ${entry.getUser().getLastname()}</td>
                                                        <c:if test="${entry.getDocteur() != null}">
                                                            <td>Doctor</td>
                                                            <td>${entry.getDocteur().getFirstname()} ${ entry.getDocteur().getLastname() }</td>
                                                        </c:if>
                                                        <c:if test="${entry.getClinique() != null}">
                                                            <td>Doctor</td>
                                                            <td>${entry.getClinique().getName()} </td>
                                                        </c:if>
                                                        <c:if test="${entry.getHopital() != null}">
                                                            <td>Doctor</td>
                                                            <td>${entry.getHopital().getName()} </td>
                                                        </c:if>
                                                        <td>
                                                            <span class="status orange"></span>
                                                            ${entry.commentaire}
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-danger " href="<c:url value="/GestionComment"><c:param name = "dlte" value = "${entry.idCommentaire}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/delete-sign.png" />
                                                                &nbsp;delete
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success " href="<c:url value="/GestionComment"><c:param name = "apprv" value = "${entry.idCommentaire}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/approve.png"/>
                                                                &nbsp;approve
                                                            </a>
                                                        </td>
                                                    </tr>
                                                
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- comment section -->

            <!-- list doctor section -->
            <main id="doctors_Section" class="hide slideBar_main">
                <div class="recent-grid-comments">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Docteurs</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <c:if test="${allDoctors == null}">
                                        <img src="<c:url value="/inc/images/greenNoDoctorPic.png"></c:url>" class="center" width="200px"></td>
                                        <h3 style="text-align: center;">Aucun docteur !</h3>
                                    </c:if>

                                    <c:if test="${allDoctors != null}">
                                        <table width="100%">
                                            <thead>
                                                <tr>
                                                    <td>Username</td>
                                                    <td>Speciality</td>
                                                    <td>ville</td>
                                                    <td>Delete</td>
                                                    <td>show profile</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="entry" items="${allDoctors}">
                                                    <tr>
                                                        <td> ${entry.getFirstname()} ${entry.getLastname()}</td>
                                                        <td>${entry.getSpeciality()}</td>
                                                        <td>${entry.getVille()} </td>
                                                        <td>
                                                            <a class="btn btn-danger " href="<c:url value="/admin"><c:param name = "dlte" value = "${entry.cin}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/delete-sign.png" />
                                                                &nbsp;delete
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success " href="<c:url value="/admin"><c:param name = "show" value = "${entry.cin}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/approve.png"/>
                                                                &nbsp;show profile
                                                            </a>
                                                        </td>
                                                    </tr>
                                                
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- !list docteur section -->

            <!-- list cliniques section -->
            <main id="cliniques_Section" class="hide slideBar_main">
                <div class="recent-grid-comments">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Cliniques</h3>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                                    <c:if test="${allCliniques == null}">
                                        <img src="<c:url value="/inc/images/noClinicPic.png"></c:url>" class="center" width="200px"></td>
                                        <h3 style="text-align: center;">Aucun clinique !</h3>
                                    </c:if>

                                    <c:if test="${allCliniques != null}">
                                        <table width="100%">
                                            <thead>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>Speciality</td>
                                                    <td>ville</td>
                                                    <td>Delete</td>
                                                    <td>show profile</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="entry" items="${allCliniques}">
                                                    <tr>
                                                        <td> ${entry.name}</td>
                                                        <td>${entry.speciality}</td>
                                                        <td>${entry.getVille()} </td>
                                                        <td>
                                                            <a class="btn btn-danger " href="<c:url value="/admin"><c:param name = "dlte_clinique" value = "${entry.cin}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/delete-sign.png" />
                                                                &nbsp;delete
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success " href="<c:url value="/admin"><c:param name = "show_clinique" value = "${entry.cin}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/approve.png"/>
                                                                &nbsp;Profile
                                                            </a>
                                                        </td>
                                                    </tr>
                                                
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- !list cliniques section -->

            <!-- List Pharmacies section -->
            <main id="pharmacies_Section" class="hide slideBar_main">
                <div class="recent-grid-comments">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Pharmacies</h3>
                                <button onclick="seeAll('pharmaBtn', 'pharmacy')">Ajouter une pharmacie <span class="las la-plus"></span></button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                                    <c:if test="${allPharmacies == null}">
                                        <img src="<c:url value="/inc/images/noPharmaPic.png"></c:url>" class="center" width="200px"></td>
                                        <h3 style="text-align: center;">Aucune pharmacie !</h3>
                                    </c:if>

                                    <c:if test="${allPharmacies != null}">
                                        <table width="100%">
                                            <thead>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>telephone</td>
                                                    <td>ville</td>
                                                    <td>en garde</td>
                                                    <td>Delete</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="entry" items="${allPharmacies}">
                                                        <tr>
                                                            <td> ${entry.name}</td>
                                                            <td>${entry.tel}</td>
                                                            <td>${entry.getVille()} </td>
                                                            <td>
                                                            <form method="POST" action="<c:url value="ToggleGarde"></c:url>" >
                                                            
                                                            <div class="custom-control custom-switch" >
                                                                <c:set var="checked" value="chekeded"></c:set>
                                                                <c:set var="id" value="${entry.idPharmacie}"></c:set>
                                                                <c:if test="${pharmacieDao.getById(id).getEn_garde() == true}">
                                                                        <input type="checkbox"  name="checkgarde"  onchange="toggleGarde('${entry.idPharmacie}')" class="custom-control-input keepcheck" id="customSwitch${entry.idPharmacie}" checked>
                                                                </c:if>
                                                                <c:if test="${pharmacieDao.getById(id).getEn_garde() == false}">
                                                                        <input type="checkbox"  name="checkgarde" onchange="toggleGarde('${entry.idPharmacie}')" class="custom-control-input keepcheck" id="customSwitch${entry.idPharmacie}">
                                                                </c:if>
                                                                    <label class="custom-control-label" for="customSwitch${entry.idPharmacie}">Toggle this switch</label>
                                                            </div>
                                                            <input type="text" hidden name="idd" value="${entry.idPharmacie }">
                                                            <button id="submit-toggle${entry.idPharmacie}" type="submit" style="display:none;"></button>
                                                            </form>
                                                            </td>
                                                            <td>
                                                                <a class="btn btn-danger " href="<c:url value="/admin"><c:param name = "dlte_pharmacie" value = "${entry.idPharmacie}"/></c:url>">
                                                                    <img src="https://img.icons8.com/metro/14/ffffff/delete-sign.png" />
                                                                    &nbsp;delete
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    
                                                    </c:forEach>
                                                
                                            </tbody>
                                        </table>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- !List Pharmacies section -->

            <!-- List Hospitals section -->
            <main id="hospitals_Section" class="hide slideBar_main">
                <div class="recent-grid-comments">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Hopitales</h3>
                                <button onclick="seeAll('hospBtn', 'hospital')">Ajouter un hopital <span class="las la-plus"></span></button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <c:if test="${allHospitals == null}">
                                        <img src="<c:url value="/inc/images/noHospitalPic.png"></c:url>" class="center" width="200px"></td>
                                        <h3 style="text-align: center;">Aucune pharmacie !</h3>
                                    </c:if>
                                    
                                    <c:if test="${allHospitals != null}">
                                        <table width="100%">
                                            <thead>
                                                <tr>
                                                    <td>Name</td>
                                                    <td>telephone</td>
                                                    <td>ville</td>
                                                    <td>Delete</td>
                                                    <td>show profile</td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="entry" items="${allHospitals}">
                                                    <tr>
                                                        <td> ${entry.name}</td>
                                                        <td>${entry.tel}</td>
                                                        <td>${entry.getVille()} </td>
                                                        <td>
                                                            <a class="btn btn-danger " href="<c:url value="/admin"><c:param name = "dlte_hopital" value = "${entry.idHopital}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/delete-sign.png" />
                                                                &nbsp;delete
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-success " href="<c:url value="/admin"><c:param name = "show_hopital" value = "${entry.idHopital}"/></c:url>">
                                                                <img src="https://img.icons8.com/metro/14/ffffff/approve.png"/>
                                                                &nbsp;show profile
                                                            </a>
                                                        </td>
                                                    </tr>
                                                
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:if>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- !List Hospitals section -->

            <!-- pharmacie --> 
            <main id="pharmacy" class="recent-grid-comments hide slideBar_main">
                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>Ajouter une nouvelle pharmacie</h3>
                        </div>
                        <div style="padding: 1rem;">
                            <div class="table-responsive">
                                <form  method="POST" action="<c:url value="/PharmacieForm" ></c:url>">
                                    <div class="form-group">
                                        <label for="inputName">Name</label>
                                        <input type="text" name="name" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="inpulVille">Ville</label>
                                        <input type="text" name="ville"  class="form-control" id="inpulVille" placeholder="Ville">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputLastName">Address</label>
                                        <input type="text" name="adresse"  class="form-control" id="inputAddress" placeholder="Address">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Phone</label>
                                        <input type="tel" name="tel" class="form-control" id="exampleInputTel" placeholder="Tel">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Location ID</label>
                                        <input type="text" name="id" class="form-control" id="exampleInputID" placeholder="LocationID">
                                    </div>
                        
                                    <button type="submit">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- pharmacie -->
        
            <!-- hospital -->
            <main id="hospital" class="hide slideBar_main">
                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>Ajouter un nouvel hopital</h3>
                        </div>
                        <div style="padding: 1rem;">
                            <div class="table-responsive">
                                <form method="POST" action="<c:url value="/HospitalForm" ></c:url>">
                                    <div class="form-group">
                                        <label for="inputName">Name</label>
                                        <input type="text" name="name" class="form-control" id="inputName" placeholder="Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputVille">Ville</label>
                                        <input type="text" name="ville" class="form-control" id="inputVille" placeholder="Ville">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" name="adresse" class="form-control" id="inputAddress" placeholder="Address">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputTel">Phone</label>
                                        <input type="tel" name="tel" class="form-control" id="exampleInputTel" placeholder="Tel">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputID">Location ID</label>
                                        <input type="text" name="id" class="form-control" id="exampleInputID" placeholder="LocationID">
                                    </div>
                                    <button type="submit">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>        
            </main>
            <!-- hospital -->

            <!-- pharmacie --> 
            <main id="new_admin" class="recent-grid-comments hide slideBar_main">
                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>Ajouter un nouveau admin</h3>
                        </div>
                        <div style="padding: 1rem;">
                            <div class="table-responsive">
                                <form  method="POST" action="<c:url value="/NewAdmin" ></c:url>">
                                    <div class="form-group">
                                        <label for="inputName">Nom</label>
                                        <input type="text" name="nom" class="form-control" id="inputName" placeholder="Nom">
                                    </div>
                                    <div class="form-group">
                                        <label for="inpulVille">Prénom</label>
                                        <input type="text" name="prenom"  class="form-control" id="inpulVille" placeholder="Prénom">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputLastName">Téléphone</label>
                                        <input type="text" name="phone"  class="form-control" id="inputAddress" placeholder="Téléphone">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                                    </div>
                        
                                    <button type="submit">Submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <!-- pharmacie -->

        </div>

    <script src='http://code.jquery.com/jquery-1.10.2.min.js'></script>
    <script>
        
        function toggleGarde(id){
            document.getElementById('submit-toggle'+id).click();
        } 
    

        var btn = document.getElementsByClassName('buttons');
        function handleClick(event, param_div_id){
            var j;
            if (event.target.classList.contains('buttons')) {
                for(var i=0; i<btn.length; i++){
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(btn[i] === event.target){
                        j = i;
                    }
                }
                
            } else {
                for(var i=0; i<btn.length; i++){
                    
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(event.target === btn[i].getElementsByTagName("span")[0] || event.target === btn[i].getElementsByTagName("span")[1]){
                        j = i;
                    }
                }
            }

            btn[j].classList.add('active');
            slideBar_mains = document.getElementsByClassName('slideBar_main');
            for(var i=0; i<slideBar_mains.length; i++){
                if(!slideBar_mains[i].classList.contains('hide')){
                    slideBar_mains[i].classList.add('hide');
                }
            }
            document.getElementById(param_div_id).classList.remove('hide');
        }

        function showComments(){
            document.getElementsByClassName("recent-grid")[0].style.display="none";
            document.getElementsByClassName("commentsSection")[0].style.display="block";

        }

        function handleOnLoad(){
            var btn = document.getElementById('dashboard');
            btn.click();
        }

        function seeAll(btnId, param_div_id) {
            var j;
            var seeAllBtn = document.getElementById(btnId);
            if (seeAllBtn.classList.contains('buttons')) {
                for(var i=0; i<btn.length; i++){
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(btn[i] === seeAllBtn){
                        j = i;
                    }
                }
                
            } else {
                for(var i=0; i<btn.length; i++){
                    
                    if(btn[i].classList.contains('active')){
                        btn[i].classList.remove('active');
                    }

                    if(seeAllBtn === btn[i].getElementsByTagName("span")[0] || event.target === btn[i].getElementsByTagName("span")[1]){
                        j = i;
                    }
                }
            }

            btn[j].classList.add('active');
            slideBar_mains = document.getElementsByClassName('slideBar_main');
            for(var i=0; i<slideBar_mains.length; i++){
                if(!slideBar_mains[i].classList.contains('hide')){
                    slideBar_mains[i].classList.add('hide');
                }
            }
            document.getElementById(param_div_id).classList.remove('hide');
        }
          

    </script>
</body>
</html>