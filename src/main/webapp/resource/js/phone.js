$(function(){
	$('#commentForm').bootstrapValidator({ 	
		errorClass:"text-danger",
		//Failed validation
		highlight:function(input){
			$(input).closest(".form-group").addClass("has-error");
		},
		//success validation
		unhighlight:function(input){
			$(input).closest(".form-group").removeClass("has-error");
		},
		//submit form
	
		 
		 fields: {
			NAME: {
				message:'Visitor cannot be empty',
				validators:{
					notEmpty:{
						message:'Visitor cannot be empty'
					},
				}
			},
			MOBILE: {
				message:'请输入正确的手机号',
				validators:{
					notEmpty: {
					},
					stringLength:{
						min:11,
						max:11,
					},
					regexp: {
						regexp:/^13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{1}[0-9]{8}$|17[0-9]{1}[0-9]{8}$|14[0-9]{1}[0-9]{8}$|000[8-9]{1}[0-9]{7}$/,
						message:'Please enter a valid phone number'
					}
					
				}
			},
			STAFF_NAME: {
				message:'Entourage cannot be empty',
				validators:{
					notEmpty:{
						message:'Entourage cannot be empty'
					},
				}
			},
			VISITOR_COMPANY: {
				message:'Company cannot be empty',
				validators:{
					notEmpty:{
						message:'Company cannot be empty'
					},
				}
			}
		    
		}
	})
	

})