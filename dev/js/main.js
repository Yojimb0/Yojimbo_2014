$(function(){
	var $win = $(window),
		$p = $('.page'),
		$m = $('.main'),
		$w = $('.w'),
		$d = $('.d'),
		$sa = $('.scrollable_area'),
		scrollWidth = null,
		mobile = ( $win.width() <= 855 ) ? true : false;

	// ENABLE TRANSITIONS AFTER LOAD
	
	$(window).load(function() {
		scrollWidth = scrollbarWidth();
		updateScrollArea($sa, scrollWidth);
		$('body').removeClass('disable_transitions');
		animateSvg();
	});

	// TODO
	$( window ).resize(function() {
		console.log('window.resize()');
		updateScrollArea($sa, scrollWidth);
	});

	// CLICK ASIDES
	if(mobile) $p.on('click', '.aside_button', function(){
		var self = this,
			$self = $(this),
			$aside = $self.closest('aside'),
			$asides = $p.find('aside'),
			c = 'aside_open';

		if($aside.hasClass(c)){
			$asides.removeClass(c);
		}else{
			$asides.removeClass(c);
			$aside.addClass(c);
		}
	});
	

	$('.w').on('click', '.project_link', function(e){
		var self = this, $self = $(this);
		$('#project_'+$self.data('project')).addClass('project_show');
	});

	$('.project_close, .overlay').on('click', function(){
		var self = this, $self = $(this);
		$('.project_show').removeClass('project_show');
	});


	
	



	
});


function animateSvg(){
	var paths = document.querySelectorAll('.c path');
	for(var i = 0; i < paths.length; ++i) {
		var path = paths[i];
		var length = path.getTotalLength();
		// Clear any previous transition
		path.style.transition = path.style.WebkitTransition = 'none';
		// Set up the starting positions
		path.style.strokeDasharray = length + ' ' + length;
		path.style.strokeDashoffset = length;
		path.style.stroke = "#333";
		path.style.strokeWidth = "2";
		path.style.strokeOpacity = "1";
		path.style.fillOpacity = "0";
		// Trigger a layout so styles are calculated & the browser
		// picks up the starting position before animating
		path.getBoundingClientRect();
		// Define our transition
		path.style.transition = path.style.WebkitTransition = 'stroke-dashoffset 2s ease-in-out, stroke-opacity 2s ease-in-out, fill-opacity 2s ease-in-out 0.5s';
		// Go!
		path.style.strokeDashoffset = '0';
		path.style.strokeOpacity = '0';
		path.style.fillOpacity = '1';
	}
}

function scrollbarWidth() {
	var w = $('.scrollbar_measure div').width();
	return (50 - w);
}

function updateScrollArea($scrollAreas, scrollWidth){
	// console.log('updateScrollArea() sw=', scrollWidth);
	// console.log('updateScrollArea() sa=', $scrollAreas);
	$scrollAreas.each(function(){
		var self = this, $self = $(this);
		$self.width($self.parent().width() + scrollWidth);
		console.log('Was ',$self.width(),'Has to be',$self.width() + scrollWidth);
	});
}