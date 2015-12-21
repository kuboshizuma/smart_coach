$(function() {
  $('#messagelog').animate({scrollTop: $('#messagelog')[0].scrollHeight - 50}, 'fast');
  Pusher.log = function(message) {
    if (window.console && window.console.log) {
      window.console.log(message);
    }
  };

  var pusherAccessKey = $('#messagelog').data('key');
  var roomId = $('#messagelog').data('id');

  var pusher = new Pusher(pusherAccessKey);
  var channel = pusher.subscribe("room_" + roomId);

  channel.bind('chat_event', function(data) {

    $('#chat_message_message').val("");
    $.ajax({
      url: "/coaches/lessons/" + data.lesson_id + "/students/" + data.student_id + "/chat_messages",
      type: "POST",
    });
    $.ajax({
      url: "/students/rooms/" + data.room_id + "/chat_messages",
      type: "POST",
    });
  });
});
