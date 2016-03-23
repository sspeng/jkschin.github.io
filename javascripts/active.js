$(function() {
  $('li:has(a[href="' + location.pathname + '"])').addClass('active');
});