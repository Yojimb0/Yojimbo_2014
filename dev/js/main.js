$(function(){

	/* SELECTORS & VARIABLES
	---------------------------------------*/
	var $win   = $(window),
		$body  = $('body'),
		$page  = $('.page', $body),
		$w     = $('.w', $page),
		$d     = $('.d', $page),
		$sa    = $('.scrollable_area', $body),
		$paths = $('.c path', $page),
		smallScreen = false,
		scrollWidth = null,
		breakPoint = 855;

	
	/* METHODS & HELPERS
	---------------------------------------*/
	// updateScrollAreas
	// Let us recalculate width of scrollable element, in order to hide the scrollbar
	function updateScrollAreas(){
		$sa.each(function(){
			var $this = $(this);
			$this.width($this.parent().width() + scrollWidth);
		});
	}

	// updateResponsiveBehaviour
	// Technique to get the responsive state (smallScreen/desktop) in the Javascript
	// In order to bind/unbind the click event on the <aside> buttons
	function updateResponsiveBehaviour(){
		var cssDisplay = $('#responsive_state').css('display');

		if( cssDisplay === 'none'){
			if(smallScreen === false) $body.on('click.aside_button', '.aside_button', asidesSwap);
			smallScreen = true;
		}else{
			$body.off('click.aside_button');
			smallScreen = false;
		}
	}

	// scrollbarWidth
	// Calculate scrollbar width, with the help ok 2 div hidden in the CSS
	function scrollbarWidth() {
		var $sbm  = $('#scrollbar_measure'),
			wParent   = $sbm.width(),
			wChildren = $('div', $sbm).width();
		$sbm.remove();
		return (wParent - wChildren);
	}

	// asidesSwap
	// Displaying / hiding asides panels, only in smallScreen behaviour
	function asidesSwap(){
		var $this = $(this),
			$aside = $this.closest('aside'),
			$asides = $('aside', $page),
			openClass = 'aside_open';
		console.log('Swapping <aside>', $this);

		if($aside.hasClass(openClass)){
			$asides.removeClass(openClass);
		}else{
			$asides.removeClass(openClass);
			$aside.addClass(openClass);
		}
	}

	// openModal
	// Opens a project popup
	function openModal(){
		var $this = $(this);
		$('#project_'+$this.data('project'), $body).addClass('project_show');
	}

	// closeModal
	// Closes a project popup
	function closeMmodal(){
		var $this = $(this);
		$('.project_show', $body).removeClass('project_show');
	}

	// animateSvg
	// Animate a fake drawing of the main SVG avatar at the site loading
	function animateSvg(){
		for(var i = 0; i < $paths.length; ++i) {
			var path = $paths[i];
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

	// init
	// Initialisation function, run once on page load
	function init(){
		// Get the width of scrollbars
		scrollWidth = scrollbarWidth();
		// Update the scrollAreas (to hide the scrollbars, depending on their width)
		updateScrollAreas();
		// Check the responsive state (smallScreen/desktop)
		updateResponsiveBehaviour();
		// Reactivate css transmission
		$('body').removeClass('disable_transitions');
		// Start the SVG animation
		animateSvg();
	}

	// updateOnResize
	// Function run at every resize event, in order to recalculate scroll areas, and update responsive state (JS side)
	function updateOnResize(){
		updateScrollAreas();
		updateResponsiveBehaviour();
	}
	

	/* EVENTS
	---------------------------------------*/
	$win.load(init);
	$win.resize(updateOnResize);
	$w.on('click', '.project_link', openModal);
	$('.project_close', $body).on('click', closeMmodal);
	$('.overlay', $body).on('click', closeMmodal);



	
});




