$(document).on('ready page:load', function() {

  $('#search-form').on('submit', function (e) {
    e.preventDefault();
    var searchValue = $('#search').val();


  $.getScript('/products?search=' + searchValue);

  });

});
