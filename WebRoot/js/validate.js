    function chkphono(){
      		if (userForm.tel.value!="") {
      			if(isNaN(userForm.tel.value)==true){
					alert("手机号只能是数字");
					userForm.tel.value="" ;
					return false;
					}
					return true ;
				}
      }
	function chkEmail(){     
   		var  reEmail  = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; 
    	   if(userForm.email.value.search(reEmail)==-1){ 
      			 alert(""); 
       			userForm.email.value=""; 
      		 return false; 
          	} 
     } 
