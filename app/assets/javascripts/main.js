$(document).on('turbolinks:load',function() {
	
	function readURL(input) {
	    var size = input.files[0].size/1024/1024;

	    if(size > 0.5){
            $('#imgError'+'.conf').removeClass("hidden");
            $('#imgErrorMsg').text('Maximum image size is 0.5MB.');
	        input.value = "";
	        return;

        }

	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#imgEvent').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#imgInp").change(function(){
	    readURL(this);
	});

    $("#imgErrorOk").click(function(){
        $('#imgError'+'.conf').addClass("hidden");
    });




    $('#datepicker').datepicker({
	    format: "dd/mm/yyyy",
	    forceParse: false,
	    todayHighlight: true,
	    autoclose: true
	});
	
	
	 $('#timepicker1').timepicker({
         template: 'dropdown',
         showInputs: false,
         minuteStep: 5,
         showMeridian: false,
         defaultTime: false

     });
	 


     $(".romoveBtn").click(function(){	        	
     	var id = $(this).attr('id');
     	var id3 = '#'+id;   
     	$('.conf').addClass("hidden");
     	$(id3+'.conf').removeClass("hidden");
	       

     });
 	$(".noBtn").click(function(){
 		var id2 = $(this).attr('id');
 		var id4 = '#'+id2;
 		$(id4+'.conf').addClass("hidden");
 		
     });
	 
	 


     $('#searchdate').datepicker({
         format: "dd/mm/yyyy",
         forceParse: false,
         todayHighlight: true,
         autoclose: true
     }).on('changeDate', function (e) {
         if(this.value != "")
             window.location.href = "calender?day=" + this.value;});


});
