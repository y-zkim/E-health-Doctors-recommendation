// variables selectors :

var sections = document.querySelectorAll('.nav-link');
var section = '.section-';
// console.log(section.concat(1));
//Fonction de Navbar
const navSlide=()=> {
    const burger = document.querySelector('.burger');
    const navbar = document.querySelector('.nav-links' );
    const navLinks = document.querySelectorAll('.nav-links li');
    
    burger.addEventListener('click',()=>{
        //toggle the navbar
        navbar.classList.toggle('nav-active');
        //links animation 
        navLinks.forEach((link ,index)=>{
           if( link.style.animation){
            link.style.animation = ``;
           }
           else{ 
            link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7+0.5}s`;
           } 
        }); 
        // burger animation  
        burger.classList.toggle('toggle'); 
    }); 
 
}  

$('.nav-links a').on('click', function(e){
   if(this.hash !== ''){
       e.preventDefault();
       const hash = this.hash;
       $('html ,body').animate({
        scrollTop : $(hash).offset().top
       },800);
       if ($('body').width()<901)
    $('.burger').click();
   }
});


// Animation of sections (animation on scroll)
AOS.init({
    duration:1000, 
    easing: 'ease', 
    mirror : true,
    offset : 20,
  });
  //Title animation TypeWriter Animation
  var typed = new Typed('.animate', {
    strings: [
        "un Medecin ?",
        "un Hopital ?",
        "une Clinique ?",
        "une Pharmacie ?",
    ],
    typeSpeed :60,
    backSpeed : 60,
    loop : true
});
navSlide();