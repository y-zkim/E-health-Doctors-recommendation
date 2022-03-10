$(document).ready(function(){
    
    $( "#showMoreBtn" ).click(function(event){
        var btnText = document.getElementById("showMoreBtn");
        if (btnText.innerHTML === "Afficher moins") {
            btnText.innerHTML = "Afficher plus"; 
            $("#showMore").slideToggle();
        } else {
            btnText.innerHTML = "Afficher moins"; 
            $("#showMore").slideToggle();
        }
    });

    $( "#showSearchBarBtn" ).click(function(event){
        $("#search_bar").slideToggle();
    });
    
    $( "#showNavBarBtn" ).click(function(event){
        if(document.getElementById('nav_bar').style.display == 'flex'){
            document.getElementById('nav_bar').style.display='none';
        } else {
            document.getElementById('nav_bar').style.display='flex';
        }
    });
    
    $( "#clearAllBtn" ).click(function(event){
        $('#NameInput').val('');
        $('#Telemedecine').prop( "checked", true );
        $('#Consultation_a_domicile').prop( "checked", true );
        $('.Rating #Tous').prop( "checked", true );
        $('.Speciality #Tous').prop( "checked", true );
        $('.Language #Tous').prop( "checked", true );
        $('.Gender #Tous').prop( "checked", true );
        filter();
    });

    $( "#clearHospitalsBtn" ).click(function(event){
        $('#NameInput').val('');
        $('.Rating #Tous').prop( "checked", true );
        filterHospitals();
    });

    $(window).resize(function() {
        if($("#search_bar").is(':hidden') && $( document ).width() >= 960){
            $("#search_bar").slideToggle();
        }
        if($("#nav_bar").is(':hidden') && $( document ).width() >= 960){
            document.getElementById('nav_bar').style.display='flex';
        }else if($( document ).width() < 960){
            document.getElementById('nav_bar').style.display='none';
        }
    });

    $(function () {
        $(document).scroll(function () {
            var $nav = $("#SectionsNavbar");
            var $InformationsPersonelle = $("#InformationsPersonelle");
            $nav.toggleClass('scrolled', $(this).scrollTop() > $InformationsPersonelle.height());

            if(document.getElementById("DoctorProfile") != null){
                var $Localisation = $("#Localisation");
                var $Evaluation = $("#Evaluation");
                var $PlusInformations = $("#PlusInformations");
                var $HopitauxCliniques = $("#HopitauxCliniques");

                if($Localisation.position() != null){
                    if($(this).scrollTop() < $Localisation.position().top){
                        $("#InformationsPersonelleBtn").click();
                    }else if($(this).scrollTop() < $Evaluation.position().top){
                        $("#LocalisationBtn").click();
                    }else if($(this).scrollTop() < $PlusInformations.position().top){
                        $("#EvaluationBtn").click();
                    }else if($(this).scrollTop() < $HopitauxCliniques.position().top){
                        $("#PlusInformationsBtn").click();
                    }else {
                        $("#HopitauxCliniquesBtn").click();
                    }
                }
            }else if(document.getElementById("HopitalProfile") != null){
                var $Localisation = $("#Localisation");
                var $Evaluation = $("#Evaluation");
                var $Docteurs = $("#Docteurs");

                if($Localisation.position() != null){
                    if($(this).scrollTop() < $Localisation.position().top){
                        $("#InformationsPersonelleBtn").click();
                    }else if($(this).scrollTop() < $Evaluation.position().top){
                        $("#LocalisationBtn").click();
                    }else if($(this).scrollTop() < $Docteurs.position().top){
                        $("#EvaluationBtn").click();
                    }else {
                        $("#DocteursBtn").click();
                    }
                }
            }
            
        });
    });

    $("#evaluation_upper_text").text("Evaluation de notres visiteurs au service de Dr." + $(".fullName").text() + " :");
    $("#evaluation_upper_text_hospital").text("Evaluation de notres visiteurs au service de " + $(".fullName").text() + " :");
    $(".card-doctor-text").text("Combien vous devez évaluer Dr." + $(".fullName").text() + "?");
    $(".card-hopital-text").text("Combien vous devez évaluer " + $(".fullName").text() + "?");

    $('[name = "ratingStars"]').click( function() {
        var rates = document.getElementsByName('ratingStars');
        var rate_value;
        for(var i = 0; i < rates.length; i++){
            if(rates[i].checked){
                rate_value = rates[i].value;
                $('#userRating').val(rates[i].value);
            }
        }
    });

    var user_comments = document.getElementsByClassName('user_comment');
    for(var i=0; i < user_comments.length; i++){
        var comment = user_comments[i].innerHTML;
        var first_part = '';
        var last_part = '';
        if(comment.length > 200){
            for(var j=0; j < 200; j++){
                first_part += comment[j];
            }

            for(var j=200; j < comment.length; j++){
                last_part += comment[j];
            }

            document.getElementsByClassName('user_comment')[i].innerHTML = first_part + "<span class='dots' >...</span><span class='last_part' style='display: none;'>" + last_part + "</span><a class='btn font-size-14 font-gilroy-bold color-second show_more_text_btn'>Afficher plus</a>";
        }
    }

    $(".show_more_text_btn").click(function(event) {
        var user_cards = document.getElementsByClassName('user-card');
        for(var i=0; i < user_cards.length; i++){
            if(event.target == user_cards[i].getElementsByClassName("show_more_text_btn")[0]){
                var dots = user_cards[i].getElementsByClassName("dots")[0];
                var last_part = user_cards[i].getElementsByClassName("last_part")[0];
                var show_more_text_btn = event.target;
                if (dots.style.display == "none") {
                    dots.style.display = "inline";
                    show_more_text_btn.innerHTML = "Afficher plus"; 
                    last_part.style.display = "none";
                  } else {
                    dots.style.display = "none";
                    show_more_text_btn.innerHTML = "Afficher moins"; 
                    last_part.style.display = "inline";
                  }
            }
        }
    });

    var comment_cards = document.getElementsByClassName('comment-card');
    if(comment_cards.length > 3){
        for(var i=3; i < comment_cards.length; i++){
            comment_cards[i].style.display = "none";
        }
        document.getElementById("moreCommentsBtn").style.visibility = "visible";
    }

    $("#show-more-comments").click(function(event) {
        if(document.getElementById("show-more-comments").innerHTML == "Afficher plus de commentaires"){
            for(var i=3; i < comment_cards.length; i++){
                comment_cards[i].style.display = "block";
            }
            document.getElementById("show-more-comments").innerHTML = "Afficher moins de commentaires";
        }else {
            for(var i=3; i < comment_cards.length; i++){
                comment_cards[i].style.display = "none";
            }
            document.getElementById("show-more-comments").innerHTML = "Afficher plus de commentaires";
        }
        
    });

    var doctor_cards = document.getElementsByClassName('doctor_card');
    if(doctor_cards.length > 8){
        
        for(var i=8; i < doctor_cards.length; i++){
            doctor_cards[i].style.display = "none";
        }
        document.getElementById("moredoctorsBtn").style.visibility = "visible";
    }

    $("#show-more-doctors").click(function(event) {
        if(document.getElementById("show-more-doctors").innerHTML == "Afficher plus de docteurs"){
            for(var i=8; i < doctor_cards.length; i++){
                doctor_cards[i].style.display = "block";
            }
            document.getElementById("show-more-doctors").innerHTML = "Afficher moins de docteurs";
        }else {
            for(var i=8; i < doctor_cards.length; i++){
                doctor_cards[i].style.display = "none";
            }
            document.getElementById("show-more-doctors").innerHTML = "Afficher plus de docteurs";
        }
        
    });

    $("#comment_header").text("Quesque vous pensez à propos de service de Dr." + $(".fullName").text() + " ?");
    $("#comment_hospital_header").text("Quesque vous pensez à propos de service de " + $(".fullName").text() + " ?");
    
    $("[name = ratingStars]").click(function(){
        document.getElementById("userOwnComment").disabled = false;
        document.getElementById("CommentBtn").disabled = false;
        document.getElementById("rating_notice").style.display = 'none';
    });
    
    $("#BiographieBtn").click(function(event) {
        var BiographieText = document.getElementById("BiographieText");
        if(BiographieText.style.display == "none"){
            $("#BiographieText").slideToggle();
            document.getElementById("markBiographie").innerHTML = '<i class="font-size-16 far fa-times-circle"></i>';
        }else {
            $("#BiographieText").slideToggle();
            document.getElementById("markBiographie").innerHTML = '<i class="font-size-16 fas fa-plus-circle"></i>';
        }
    });

    $("#EducationBtn").click(function(event) {
        var EducationText = document.getElementById("EducationText");
        if(EducationText.style.display == "none"){
            $("#EducationText").slideToggle();
            document.getElementById("markEducation").innerHTML = '<i class="font-size-16 far fa-times-circle"></i>';
        }else {
            $("#EducationText").slideToggle();
            document.getElementById("markEducation").innerHTML = '<i class="font-size-16 fas fa-plus-circle"></i>';
        }
    });

    $("#RecompensesBtn").click(function(event) {
        var RecompensesText = document.getElementById("RecompensesText");
        if(RecompensesText.style.display == "none"){
            $("#RecompensesText").slideToggle();
            document.getElementById("markRecompenses").innerHTML = '<i class="font-size-16 far fa-times-circle"></i>';
        }else {
            $("#RecompensesText").slideToggle();
            document.getElementById("markRecompenses").innerHTML = '<i class="font-size-16 fas fa-plus-circle"></i>';
        }
    });
    
});


var autocomplete;
function initialize() {
    autocomplete = new google.maps.places.Autocomplete(
    (document.getElementById('autocomplete')),
    { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
    });
}

function initMap() {
    const uluru = { lat: 31.791702, lng: -7.09262 };
    
    const request = {
      placeId: document.getElementById("place_id").innerHTML,
      fields: ["name", "formatted_address", "place_id", "geometry"],
    };
    
    
    const map = new google.maps.Map(document.getElementById("map"), {
      center: uluru,
      zoom: 15,
    });
    
    const infowindow = new google.maps.InfoWindow();
    const service = new google.maps.places.PlacesService(map);
    
    service.getDetails(request, (place, status) => {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
            const marker = new google.maps.Marker({
                position: place.geometry.location,
                map: new google.maps.Map(document.getElementById("map"), {
                center: place.geometry.location,
                zoom: 15,
                })
            });

            google.maps.event.addListener(marker, "click", function () {
                infowindow.setContent(
                    "<div class='text-center justify-content-center'>" +
                        "<img src='"+ document.getElementById("item_img").src + "' width='100 px' class='mx-3 img-fluid img-responsive border border-3 rounded'>" +
                        "<h2 class='font-gilroy-bold font-size-14'>" + place.name + "</h2>" +
                        "<i class='fas fa-map-marker-alt text-danger'></i>" +
                        "<span class='font-size-12 font-weight-bold font-montserrat color-primary'> &nbsp;" + place.formatted_address + "</span>" +
                    "</div>"
                );
                infowindow.open(map, this);
            });

            document.getElementById("place_adresse").innerHTML = place.formatted_address;
            document.getElementById("direction_anchor").href = "https://www.google.com/maps/search/?api=1&query=Google&query_place_id=" + place.place_id;
        }
    });
}

function initMapHospitalProfile() {
    const uluru = { lat: 31.791702, lng: -7.09262 };
    
    const request = {
      placeId: document.getElementById("place_id").innerHTML,
      fields: ["name", "formatted_address", "place_id", "geometry"],
    };
    
    
    const map = new google.maps.Map(document.getElementById("map"), {
      center: uluru,
      zoom: 15,
    });
    
    const infowindow = new google.maps.InfoWindow();
    const service = new google.maps.places.PlacesService(map);
    
    service.getDetails(request, (place, status) => {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
            const marker = new google.maps.Marker({
                position: place.geometry.location,
                map: new google.maps.Map(document.getElementById("map"), {
                center: place.geometry.location,
                zoom: 15,
                })
            });

            google.maps.event.addListener(marker, "click", function () {
                infowindow.setContent(
                    "<div class='text-center justify-content-center'>" +
                        "<h2 class='font-gilroy-bold font-size-14'>" + place.name + "</h2>" +
                        "<i class='fas fa-map-marker-alt text-danger'></i>" +
                        "<span class='font-size-12 font-weight-bold font-montserrat color-primary'> &nbsp;" + place.formatted_address + "</span>" +
                    "</div>"
                );
                infowindow.open(map, this);
            });

            document.getElementById("place_adresse").innerHTML = place.formatted_address;
            document.getElementById("direction_anchor").href = "https://www.google.com/maps/search/?api=1&query=Google&query_place_id=" + place.place_id;
        }
    });
}

function initHospitalMap() {
    const uluru = { lat: 31.791702, lng: -7.09262 };
    
    
    var map = new google.maps.Map(document.getElementById("map"), {
      center: uluru,
      zoom: 15,
    });
    
    const infowindow = new google.maps.InfoWindow();
    const service = new google.maps.places.PlacesService(map);

    var items = document.getElementsByClassName("item");
    var places_id = document.getElementsByClassName("place_id");
    var Directions = document.getElementsByClassName("direction_anchor");
    
    for(var i=0; i<items.length; i++){
        const request = {
            placeId: places_id[i].innerHTML,
            fields: ["name", "formatted_address", "place_id", "geometry"]
        };
        var loop = 0;
        service.getDetails(request, (place, status) => {
            loop++;
            
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                if(loop==1){
                    map = new google.maps.Map(document.getElementById("map"), {
                        center: place.geometry.location,
                        zoom: 12,
                        streetViewControl: false,
                        scaleControl: true,
                        mapTypeControl: false
                    });
                    
                }
                
                const marker = new google.maps.Marker({
                    position: place.geometry.location,
                    map: map
                });
    
                google.maps.event.addListener(marker, "click", function () {
                    infowindow.setContent(
                        "<div class='text-center justify-content-center'>" +
                            "<h2 class='font-gilroy-bold font-size-14'>" + place.name + "</h2>" +
                            "<i class='fas fa-map-marker-alt text-danger'></i>" +
                            "<span class='font-size-12 font-weight-bold font-montserrat color-primary'> &nbsp;" + place.formatted_address + "</span>" +
                        "</div>"
                    );
                    infowindow.open(map, this);
                });
    
                Directions[loop-1].href = "https://www.google.com/maps/search/?api=1&query=Google&query_place_id=" + place.place_id;
            }
        });
    }
    
}

function checkWorkingTime(btn){
    var items = document.getElementsByClassName('item');

    for(var i = 0; i < items.length; i++){
        if(items[i].getElementsByClassName("fullName")[0] == btn){
            var item = items[i];
        }
    }

    if(item.classList.contains("jour_nuit")){
        return "jour_nuit";
    }else if(item.classList.contains("jour")){
        return "jour";
    }
}

function showPharmaClicked(event){
    btn = event.target;
    var items = document.getElementsByClassName('item');

    for(var i = 0; i < items.length; i++){
        if(items[i].getElementsByClassName("fullName")[0] == btn){
            google.maps.event.trigger(markers[i], 'click');
        }
    }
}

var markers = [];
function initPharmacyMap() {
    const uluru = { lat: 31.791702, lng: -7.09262 };
    
    
    var map = new google.maps.Map(document.getElementById("map"), {
      center: uluru,
      zoom: 15,
    });
    
    const infowindow = new google.maps.InfoWindow();
    const service = new google.maps.places.PlacesService(map);

    var items = document.getElementsByClassName("item");
    var places_id = document.getElementsByClassName("place_id");
    var Directions = document.getElementsByClassName("direction_anchor");
    
    
    for(var i=0; i<items.length; i++){
        const request = {
            placeId: places_id[i].innerHTML,
            fields: ["name", "formatted_address", "place_id", "geometry"]
        };
        var loop = 0;
        service.getDetails(request, (place, status) => {
            loop++;
            setWorkingTimes();
            if (status === google.maps.places.PlacesServiceStatus.OK) {
                if(loop==1){
                    map = new google.maps.Map(document.getElementById("map"), {
                        center: place.geometry.location,
                        zoom: 13,
                        streetViewControl: false,
                        scaleControl: true,
                        mapTypeControl: false
                    });
                    
                }

                const marker = new google.maps.Marker({
                    position: place.geometry.location,
                    map: map,
                    animation: google.maps.Animation.DROP,
                    icon: markers_icons[loop-1]
                });
    
                google.maps.event.addListener(marker, "click", function () {
                    infowindow.setContent(
                        "<div class='text-center justify-content-center'>" +
                            "<h2 class='font-gilroy-bold font-size-14'>" + place.name + "</h2>" +
                            "<i class='fas fa-map-marker-alt text-danger'></i>" +
                            "<span class='font-size-12 font-weight-bold font-montserrat color-primary'> &nbsp;" + place.formatted_address + "</span>" +
                        "</div>"
                    );
                    infowindow.open(map, this);
                });

                marker.addListener("click", function() {
                    marker.setAnimation(google.maps.Animation.BOUNCE);
                    map.setZoom(16);
                    setTimeout(function(){ marker.setAnimation(null); }, 1000);
                });

                markers.push(marker);
    
                Directions[loop-1].href = "https://www.google.com/maps/search/?api=1&query=Google&query_place_id=" + place.place_id;
            }
        });
        
    }
    
}

function filterHospitals(){
    var items = document.getElementsByClassName('item');

    for(var i = 0; i < items.length; i++){
        items[i].style.display = 'none';
    }

    items = filterRadio(items, 'rating');
    items = filterByName(items);

    for(var i = 0; i < items.length; i++){
        items[i].style.display = "inline";
    }

    return items;
}

function filterPharmacies(){
    var items = document.getElementsByClassName('item');

    for(var i = 0; i < items.length; i++){
        items[i].style.display = 'none';
    }

    items = filterRadio(items, 'working_time');
    items = filterByName(items);

    for(var i = 0; i < items.length; i++){
        items[i].style.display = "inline";
    }

    return items;
}

var markers_icons = [];
function setWorkingTimes(){
    var items = document.getElementsByClassName('item');
    var working_times = document.getElementsByClassName('working_time');

    for(var i = 0; i < items.length; i++){
        if(items[i].classList.contains("jour_nuit")){
            working_times[i].innerHTML = '</span><span class="font-size-12 font-montserrat text-success"><i class="fas fa-check-double"></i> &nbsp; Ouvert toute la journée (24 heures)';
            markers_icons.push("https://i.ibb.co/cDt5BR9/geo-green.png");
        }else if(items[i].classList.contains("jour")){
            working_times[i].innerHTML = '</span><span class="font-size-12 font-montserrat text-primary"><i class="fas fa-sun"></i> &nbsp; Ouvert seulement le jour';
            markers_icons.push("https://i.ibb.co/FJg8GLs/geo-blue.png");
        }
    }
}

function filter() {

    var items = document.getElementsByClassName('item');

    for(var i = 0; i < items.length; i++){
        items[i].style.display = 'none';
    }

    items = filterRadio(items, 'Speciality');
    items = filterRadio(items, 'rating');
    items = filterRadio(items, 'gender');
    items = filterBySevicesSpecial(items);
    items = filterRadio(items, 'Language');
    items = filterByName(items);

    for(var i = 0; i < items.length; i++){
        items[i].style.display = "inline";
    }

    return items;
}

function filterRadio(items, type){
    var type = document.getElementsByName(type);
    var type_id;
    var choosen_items = [];

    for(var i = 0; i < type.length; i++){
        if(type[i].checked){
            type_id = type[i].id;
        }
    }

    if(type_id == 'Tous'){
        return items;
    }else{
        for(var i = 0; i < items.length; i++){
            if(items[i].classList.contains(type_id)){
                choosen_items.push(items[i]);
            }
        }
        return choosen_items;
    }
}

function filterBySevicesSpecial(items) {
    var Sevices_Special = document.getElementsByName('Sevices_Special');
    var Sevices_Special_id = [];
    var choosen_items = [];

    for(var i = 0; i < Sevices_Special.length; i++){
        if(Sevices_Special[i].checked){
            Sevices_Special_id.push(Sevices_Special[i].id);
        }
    }

    if(Sevices_Special_id.length == 2){
        return items;
    }else if(Sevices_Special_id.length == 0){
        for(var i = 0; i < items.length; i++){
            if(!items[i].classList.contains("Telemedecine") && !items[i].classList.contains("Consultation_a_domicile")){
                choosen_items.push(items[i]);
            }
        }
        return choosen_items;
    }else{
        for(var i = 0; i < items.length; i++){
            if(items[i].classList.contains(Sevices_Special_id[0])){
                choosen_items.push(items[i]);
            }
        }
        return choosen_items;
    }
}

function filterByName(items) {
    var NameInput = document.getElementById('NameInput').value;
    var choosen_items = [];

    if(NameInput == ''){
        return items;
    }else{
        for(var i = 0; i < items.length; i++){
            var fullName = items[i].getElementsByClassName('fullName');
            if(fullName[0].innerHTML.toLowerCase().includes(NameInput.toLowerCase())){
                choosen_items.push(items[i]);
            }
        }
        return choosen_items;
    }
}

// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("rateBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

if(btn!=null) {
	// When the user clicks on the button, open the modal
	btn.onclick = function() {
	  modal.style.display = "block";
	}
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
}
