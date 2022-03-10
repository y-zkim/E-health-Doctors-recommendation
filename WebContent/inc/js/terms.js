    function checkTerms(){
    	if($('#agree-term').prop('checked') == true){
            $('input[type="submit"]').prop('disabled', false);
         }else{
              $('input[type="submit"]').prop('disabled', true);
       }
    }
 