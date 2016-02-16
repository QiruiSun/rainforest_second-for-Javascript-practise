$(document).on('ready page:load', function() {

  $('#search-form').on('submit', function (e) {
    e.preventDefault();
    var searchValue = $('#search').val();


  $.getScript('/products?search=' + searchValue);

  });

  $(window).scroll(function() {
    var url = $('.pagination span.next').children().attr('href');

    if ( url && $(window).scrollTop() > $(document).height() - $(window).height() - 10) {
      $('.pagination').text('Loading more products.....');
      return $.getScript(url);
      // console.log($('.pagination span.next').children().attr('href'));
      // $.getScript($('.pagination span.next').children().attr('href'));
    }
  });
});
