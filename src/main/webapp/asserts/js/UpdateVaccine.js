$(document).ready(function(){
    $("#formAdd").validate({
        rules: {
            id: {
                required: true,
                maxlength: 10,
            },
            vaccineName: {
                required: true,
                 maxlength: 50,
            },
            usage: {
               
                maxlength: 200,
            },
            indication: {
                
                maxlength: 200,
            },
            contraindication: {
                
                maxlength: 200,
            },
            numberOfInjection: {
				required: true,
                number: true,
                max:15,
			},
			origin: {
                maxlength: 50,
            },
        },
        message: {
           id: {
                required: "Pls input id of vaccine",
                maxlength: "Pls input id of vaccine must at least 10c",
           }, 
            vaccineName: {
                required: "Pls input name of vaccine",
                maxlength: "Pls input name of vaccine must at least 50c",
           }, 
            usage: {
                
                maxlength: "Pls input usage of vaccine must at least 200c",
           },
           indication: {
                
                maxlength: "Pls input usage of vaccine must at least 200c",
           }, 
          contraindication: {
                
                maxlength: "Pls input usage of vaccine must at least 200c",
           },
           numberOfInjection: {
                required: "Pls input number of injection",
                number: "Pls input number of injection must is number",
                max: "Pls input number of injection must small than 15",
           },
           origin: {
                
                maxlength: "Pls input origin of vaccine must at least 50c",
           },   
        }
    })
})

function submitValidate(){
	var dateStart =	new Date($("#vaccine-time-next-injection").val());
	var dateEnd = new Date($("#vaccine-time-end-injection").val());
	
	if(dateStart < dateEnd){
		if ($("#formAdd").valid()) {
		return true;
        }else{
            return false;
        }
	}else{
		
		var x = $("#col-time-begin").html();
		x+="<span class='error'>Time begin is before time end</span>";
		$("#col-time-begin").html(x);
		
		return false;
		
		}
	
    
    }
function onchangeId(){
	alert("Vaacine Id can't change to update!")
}