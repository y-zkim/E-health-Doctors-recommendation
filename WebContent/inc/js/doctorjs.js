	    function postLogin(event) {
	        var form = document.getElementById("signup-form");
	        form.submit();
	
	        event.preventDefault();
	    }
    
    function changeFunc() {
        var selectBox = document.getElementById("practice");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
               if(selectedValue=='cabinet_medical'){
                   document.getElementById("Speciality").style.display='block';
               }
       
       }