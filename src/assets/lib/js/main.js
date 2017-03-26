$(document).ready(function () {
  'use strict';

	// Preloader
  var preloader = $('.preloader');
  $(window).load(function () {
    preloader.remove();
  });

	// Navbar Collapse Button

  $('.button-collapse').sideNav();

	// Slider

  $('.slider').slider({
    full_width: true
  });

	// Full Screen Parallax

  var slideHeight = $(window).height();
  $('.full-screen').css('height', slideHeight);
  $(window).resize(function () {
    $('.full-screen').css('height', slideHeight);
  });

	// Navbar-Collapse (when scrolling)

  $(window).scroll(function () {
    if ($('header').offset().top > 50) {
      $('nav').addClass('top-nav-collapse');
    } else {
      $('nav').removeClass('top-nav-collapse');
    }
  });

	// Page Scroll

  $(function () {
    $('a.page-scroll').bind('click', function (event) {
      var $anchor = $(this);
      $('html, body').stop().animate({
        scrollTop: $($anchor.attr('href')).offset().top
      }, 1500, 'easeInOutExpo');
      event.preventDefault();
    });
  });

	// Owl Carousel (Testimonials)

  $('#owl-testimonials').owlCarousel({

    navigation: false, // hide next and prev buttons
    slideSpeed: 300,
    paginationSpeed: 400,
    singleItem: true

  });

 // Objects Filtre

  $('#portfolio-items').mixItUp({
    animation: {
      effects: 'fade rotateY(-25deg)'
    }
  });
});
