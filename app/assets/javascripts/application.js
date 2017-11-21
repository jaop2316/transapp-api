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

    $('.nav-pills > li > a').each(function () {
        doScroll(this)
    });

    $('.lead .btn-primary').each(function(){
        doScroll(this)
    });
});
