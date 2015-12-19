$(function() {
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
    var messagelog = document.getElementById('messagelog');
    var messagep = document.createElement('p');
    messagep.innerHTML = data.message;
    messagelog.appendChild(messagep);
  });
});
