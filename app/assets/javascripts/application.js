// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {
	
	var $header = $('.pageHeader');
  // Nav Toggle Button
  $('.nav-toggle').click(function(){
      $header.toggleClass('open');
  });
  
  //dropdown
  var Accordion = function(el, multiple) {
    this.el = el || {};
    // more then one submenu open?
    this.multiple = multiple || false;
    
    var dropdownlink = this.el.find('.drawer_dropdown_item');
    dropdownlink.on('click',
                    { el: this.el, multiple: this.multiple },
                    this.dropdown);
  };
  
  Accordion.prototype.dropdown = function(e) {
    var $el = e.data.el,
        $this = $(this),
        //this is the ul.submenuItems
        $next = $this.next();
    
    $next.slideToggle();
    $this.parent().toggleClass('open');
    
    if(!e.data.multiple) {
      //show only one menu at the same time
      $el.find('.drawer_dropdown_menu').not($next).slideUp().parent().removeClass('open');
    }
  }
  
  var accordion = new Accordion($('.grobalNaviList'), false);
  
  $('.drawer_dropdown_menu li a').on('click', function() {
		$('.drawer').drawer('close');
	});
	
	//scroll
	$('a[href^="#"]').click(function() {
	  var speed = 400;
	  var href= $(this).attr("href");
	  var target = $(href == "#" || href == "" ? 'html' : href);
	  var position = target.offset().top;
	  $('body,html').animate({scrollTop:position}, speed, 'swing');
	  return false;
	});
   
	//current	
	$('.grobalNavi li a').each(function(){
	    var $href = $(this).attr('href');
	    if(location.href.match($href)) {
	        $(this).parent('li').addClass('active');
	    } else {
	        $(this).parent('li').removeClass('active');
	    }
	});
	
	//current		
	var url = location.pathname.split("/")[2];
	var navList = $(".localNaviList li a");
	
	// 各aタグに対して設定
	navList.each(function(){
    var href = $(this).attr("href").split("/")[2];
    if( href == url ) {
        $(this).addClass("active");
    };
	});
});