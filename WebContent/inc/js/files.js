		const btn_one   = document.getElementById("upload-button1")
        const btn_two   = document.getElementById("upload-button2")
        const btn_three = document.getElementById("upload-button3")
        const btn_four  = document.getElementById("upload-button4")

        const readFileBtn1 = document.getElementById("hidden-upload1")
        const readFileBtn2 = document.getElementById("hidden-upload2")
        const readFileBtn3 = document.getElementById("hidden-upload3")
        const readFileBtn4 = document.getElementById("hidden-upload4")

        const uploadName1 = document.getElementById("upload-name1")
        const uploadName2 = document.getElementById("upload-name2")
        const uploadName3 = document.getElementById("upload-name3")
        const uploadName4 = document.getElementById("upload-name4")

        // one
        
        btn_one.addEventListener("click", function(){
            readFileBtn1.click();
        })

        readFileBtn1.addEventListener("change", function(){
            if(readFileBtn1.value){
                uploadName1.value = readFileBtn1.value.match(/[\/\\]([\w\d\s\.\-\(\)]+)$/)[1];
            }
        })

        // two

        btn_two.addEventListener("click", function(){
            readFileBtn2.click();
        })

        readFileBtn2.addEventListener("change", function(){
            if(readFileBtn2.value){
                uploadName2.value = readFileBtn2.value.match(/[\/\\]([\w\d\s\.\-\(\)]+)$/)[1];
            } 
        })

        // three

        btn_three.addEventListener("click", function(){
            readFileBtn3.click();
        })

        readFileBtn3.addEventListener("change", function(){
            if(readFileBtn3.value){
                uploadName3.value = readFileBtn3.value.match(/[\/\\]([\w\d\s\.\-\(\)]+)$/)[1];
            }
        })

        // four

        btn_four.addEventListener("click", function(){
            readFileBtn4.click();
        })

        readFileBtn4.addEventListener("change", function(){
            if(readFileBtn4.value){
                uploadName4.value = readFileBtn4.value.match(/[\/\\]([\w\d\s\.\-\(\)]+)$/)[1];
            }
        })