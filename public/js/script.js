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

  var cache = {},
      lastXhr;
  $('#apps input[type=search]').autocomplete({
    minLength: 2,
    source: function( request, response ) {
      var term = request.term;
      if ( term in cache ) {
        response( cache[term] );
        return;
      } else {
        lastXhr = $.getJSON( '/apps/search', { query: term }, function( data, status, xhr ) {
          cache[ term ] = data;
          if ( xhr === lastXhr ) {
            response( data );
          }
        });
      }
    },
    select: function( e, ui ) {
      // redirect user to path of app
      window.location.href = ui.item.url;
    }
  });
}

window.app = app;

$(function(){
	app.init();
});
