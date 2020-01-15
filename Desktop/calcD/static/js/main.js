"use strict"
$(document).ready(function() {

	$('form').on('submit', function(event) {

		$.ajax({
			data : {
	            number1 : $('#number_box1').val(),
              number2 : $('#number_box2').val()
            },
			type : 'POST',
			url : '/process'
		})
		.done(function(data) {
            $('#rezultat').text(data.result).show();			
	});

		event.preventDefault();

	});
});
//sdfsdf
