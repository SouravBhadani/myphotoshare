function game_over(result){
	if (result){
		$('#stand_button,#hit_button').attr("href", "javascript:void(0);");
		setTimeout(function(){
			$('#winner_text').text(result);
			$('#myModal').modal();
			//$('button.hide').trigger('click');
		}, 100);
	}
}

function game_stand(){
	setTimeout(function(){
        $("#stand_button").trigger('click');
	}, 200);
}   




