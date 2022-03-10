var btn = document.getElementsByClassName('buttons');
function handleClick(event){
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
    document.getElementById('page-name').innerText = btn[j].getElementsByTagName("span")[1].innerText;

    var slidebar_menus = document.getElementsByClassName("slidebar-menu");
    for(var i=0; i < slidebar_menus.length; i++){
        slidebar_menus[i].style.display = "none";
    }
    slidebar_menus[j].style.display = "block";
}

function Trouverplace_id(){
    window.open("https://developers-dot-devsite-v2-prod.appspot.com/maps/documentation/utils/geocoder");
}

function loadImage(event) {
    var selectedFile = event.target.files[0];
    var reader = new FileReader();

    var imgtag = document.getElementById("imageDoctor");
    imgtag.title = selectedFile.name;

    reader.onload = function(event) {
        imgtag.src = event.target.result;
    };

    reader.readAsDataURL(selectedFile);
    //document.getElementById("imageDoctor").src = document.getElementById("imageInput").value;
}

tdComments = document.getElementsByClassName("tdComment");
for (var i = 0; i < tdComments.length; i++){
    comment = tdComments[i].getElementsByClassName('smallComment')[0].innerText;
    if(comment.length > 50) {
        var shownComment = '';
        for(var j = 0; j < 50; j++) {
            shownComment += comment[j];
        }
        shownComment += '...';
        tdComments[i].getElementsByClassName('smallComment')[0].innerText = shownComment;
    }
}

function voireComments(){
    btn[3].click();
}

function voireAssociations(){
    btn[4].click();
}

function activetoggleInputs(){
    
    document.getElementById("enregistrerToggle").style.display = "inline";
    document.getElementById("annulerToggle").style.display = "inline";
}

function modifierAuth() {
    authInputs = document.getElementsByClassName("authInput");
    for(var i = 0; i < authInputs.length; i++) {
        authInputs[i].disabled = false;
    }
    document.getElementById("modifierAuth").style.display = "none";
    document.getElementById("enregistrerAuth").style.display = "inline";
    document.getElementById("annulerAuth").style.display = "inline";
}

function modifierInfoPerso() {
    infoInputs = document.getElementsByClassName("infoInput");
    for(var i = 0; i < infoInputs.length; i++) {
        infoInputs[i].disabled = false;
    }
    document.getElementById("modifierInfoPerso").style.display = "none";
    document.getElementById("enregistrerInfoPerso").style.display = "inline";
    document.getElementById("annulerInfoPerso").style.display = "inline";
}

function modifierInfoCabinet() {
    infoInputs = document.getElementsByClassName("infoInputCabinet");
    for(var i = 0; i < infoInputs.length; i++) {
        infoInputs[i].disabled = false;
    }
    document.getElementById("modifierInfoCabinet").style.display = "none";
    document.getElementById("enregistrerInfoCabinet").style.display = "inline";
    document.getElementById("annulerInfoCabinet").style.display = "inline";
}

function modifierplace_id() {
    document.getElementById("place_id").disabled = false;
    
    document.getElementById("modifierplace_id").style.display = "none";
    document.getElementById("enregistrerplace_id").style.display = "inline";
    document.getElementById("annulerplace_id").style.display = "inline";
    document.getElementById("Trouverplace_id").style.display = "inline";
}

function modifierImagePerso() {

    document.getElementById("modifierImagePerso").style.display = "none";
    document.getElementById("imageInput").style.display = "inline";
    document.getElementById("enregistrerImagePerso").style.display = "inline";
    document.getElementById("annulerImagePerso").style.display = "inline";
}

function reloadPage() {
    location.reload();
}

function hideNewEduc() {
    document.getElementById("nouvelleEducation").style.display = "none";
}

function ajouterEduc() {
    document.getElementById("nouvelleEducation").style.display = "inline";
}

function hideNewAward() {
    document.getElementById("nouvelleRecompenses").style.display = "none";
}

function ajouterAward() {
    document.getElementById("nouvelleRecompenses").style.display = "inline";
}

var diplomeYearsSelect = document.getElementById("anneeDiplome");
var recompenseYearsSelect = document.getElementById("anneeRecompense");
var currentDate = new Date();

for(var i = 1970; i < currentDate.getFullYear() + 1; i++){
    var opt = document.createElement('option');
    opt.appendChild( document.createTextNode(i) );
    opt.value = i;
    diplomeYearsSelect.appendChild(opt);
}

for(var i = 1970; i < currentDate.getFullYear() + 1; i++){
    var opt = document.createElement('option');
    opt.appendChild( document.createTextNode(i) );
    opt.value = i;
    recompenseYearsSelect.appendChild(opt); 
}

/*for(var i = 0; i < 24; i++) {
    var hour = '';
    if(i<10) {
        hour += "0";
    }
    hour += i + ":00";
    var opt = document.createElement('option');
    opt.appendChild( document.createTextNode(hour) );
    opt.value = hour;
    document.getElementById("heure_debut").appendChild(opt); 
}

for(var i = 0; i < 24; i++) {
    var hour = '';
    if(i<10) {
        hour += "0";
    }
    hour += i + ":00";
    var opt = document.createElement('option');
    opt.appendChild( document.createTextNode(hour) );
    opt.value = hour;
    document.getElementById("heure_fin").appendChild(opt); 
}*/

/*var jours = ["Lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"];
for(var i = 0; i < jours.length; i++){
    var opt = document.createElement('option');
    opt.appendChild( document.createTextNode(jours[i]) );
    opt.value = jours[i];
    document.getElementById("jour_debut").appendChild(opt); 
}
for(var i = 0; i < jours.length; i++){
    var opt = document.createElement('option');
    opt.appendChild( document.createTextNode(jours[i]) );
    opt.value = jours[i];
    document.getElementById("jour_fin").appendChild(opt); 
}*/

function initMap() {
    const uluru = { lat: 31.791702, lng: -7.09262 };
    
    const request = {
      placeId: document.getElementById("place_id").value,
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
                streetViewControl: false,
                scaleControl: true,
                mapTypeControl: false
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
        }
    });
}

function toggleBtnClick(){
    var sideebarTexts = document.getElementsByClassName('sideebarText');
    if(sideebarTexts[0].style.display == "none"){
        for(var i = 0; i < sideebarTexts.length; i++){
            sideebarTexts[i].style.display == "inline";
        }
    }else {
        for(var i = 0; i < sideebarTexts.length; i++){
            sideebarTexts[i].style.display == "none";
        }
    }
}