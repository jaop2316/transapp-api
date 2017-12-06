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
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function () {
    function doScroll(elem) {
        $(elem).click(function (e) {
            e.preventDefault();
            var dtop = $(window).width() < 768 ? 55 : 1;
            var target = $(elem).attr('href').replace('/', '#');
            console.log(target)
            $('html, body').animate({scrollTop: $(target).offset().top - dtop}, 800);
        });
    }

    /*$('.nav-pills > li > a').each(function () {
        doScroll(this)
    });*/

    $('.lead .btn-primary').each(function () {
        doScroll(this)
    });


    /*
    * Change a navbar color to secondary screens
    * */
    var ready = function () {
        if ($('.main-banner').length != 1) {
            console.log("no tiene main banner");
            $('header').addClass('header-white');
            $('header .nav-pills').addClass('blue-links');
        }

        $('.stations-detail-page img').addClass('img-responsive');
    };

    $(document).on('turbolinks:load', ready);

    /**
     * Listen to scroll to change header opacity class
     */
    function checkScroll() {
        var startY = $('header .nav-pills').height() * 2; //The point where the navbar changes in px

        if ($(window).scrollTop() > startY) {
            $('header').addClass('header-white');
            $('header .nav-pills').addClass('blue-links');
        } else {
            $('header').removeClass('header-white');
            $('header .nav-pills').removeClass('blue-links');
        }
    }

    /*$(window).scroll(function () {
        console.log("scroll");
        $('.region-content .row:not(.footer-content)').each(function (index) {
            console.log($(this));
            if ($(this).hasClass('routes') || $(this).hasClass('places')) {
                $('header').addClass('header-white');
                $('header .nav-pills').addClass('blue-links');
            }
            else {
                $('header').removeClass('header-white');
                $('header .nav-pills').removeClass('blue-links');
            }
        });


    });*/


});
