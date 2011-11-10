(function() {
  var App, Controller;

  App = (function() {

    function App() {
      var _this = this;
      this.controller = new Controller();
      this.socket = new WebSocket('ws://localhost:8080');
      this.socket.onmessage = function(data) {
        return _this.onSocketMessage(data);
      };
    }

    App.prototype.onSocketMessage = function(data) {
      var message, method;
      message = $.parseJSON(data.data);
      method = message.action.substr(0, 1).toUpperCase() + message.action.substr(1);
      return this.controller["on" + method](message.args);
    };

    return App;

  })();

  Controller = (function() {

    function Controller() {}

    Controller.prototype.onSyncPlayers = function(args) {
      var player, _i, _len, _ref, _results;
      $('#players').empty();
      _ref = args.players;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        player = _ref[_i];
        _results.push($('#players').append("<li>" + player.name + "</li>"));
      }
      return _results;
    };

    return Controller;

  })();

  $(function() {
    return new App();
  });

}).call(this);
