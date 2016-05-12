$( document ).ready(function() {
  $('.more-comments').click( function() {
    $(this).on('ajax:success', function(event, data, status, xhr) {
      var eventId = $(this).data("event-id");
      $("#comments_" + eventId).html(data);
      $("#comments-paginator-" + eventId).html("<a id='more-comments' data-event-id=" + eventId + "data-type='html' data-remote='true' href='/events/" + eventId + "/comments>show more comments</a>");
    });
  });
});