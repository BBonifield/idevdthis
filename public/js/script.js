var app = {}

app.name = 'iDevd this';

app.init = function (){
	$('.page').first().show();
	
	$('.actions .button').click(function(e){
		e.preventDefault();
		$this = $(this);

		$this.parents('.button-group').find('.button').removeClass('primary');
		$this.addClass('primary');

		$('.page').hide();
		$('#'+ $this.data('page')).show();
	});
}

window.app = app;

$(function(){
	app.init();
});