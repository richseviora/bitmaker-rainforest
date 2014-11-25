/**
 * Created by richardseviora on 14-11-25.
 */
$(document).on('ready page:load', function() {
    if ($('.pagination').length) { // Determines if pagination is present.
        $(window).scroll(function() { // Attaches the method below to the scroll function.
            var url = $('.pagination span.next').children().attr('href'); // Gets the URL to submit the request to.
            if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) { // If there is a next, if the scroll top is greater than the difference between the document height and the window height minus 50, then get more.
                $('.pagination').text("Fetching more products...");
                return $.getScript(url);
            }
        });
    }
});