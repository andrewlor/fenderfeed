var ready = function() {

    var menu_speed = 200;

    $(".menu_cars_text").hide();
    $(".menu_cars_popup").hide();

    $(".menu_cars").hover(
        function() {
            $(".menu_cars_popup").slideDown(menu_speed);
            $(".menu_cars_text").slideDown(menu_speed);
        }, function() {
            $(".menu_cars_popup").slideUp(menu_speed);
            $(".menu_cars_text").slideUp(menu_speed);
        }
    );

    $(".menu_profile_text").hide();
    $(".menu_profile_popup").hide();

    $(".menu_profile").hover(
        function() {
            $(".menu_profile_popup").slideDown(menu_speed);
            $(".menu_profile_text").slideDown(menu_speed);
        }, function() {
            $(".menu_profile_popup").slideUp(menu_speed);
            $(".menu_profile_text").slideUp(menu_speed);
        }
    );

    $(".menu_icon_popup").hide();
    $(".menu_icon").hover(
        function() {
            $(".menu_icon_popup").slideDown(menu_speed);
        }, function() {
            $(".menu_icon_popup").slideUp(menu_speed);
        }
    );
};

$(document).ready(ready);
$(document).on('page:load', ready);
