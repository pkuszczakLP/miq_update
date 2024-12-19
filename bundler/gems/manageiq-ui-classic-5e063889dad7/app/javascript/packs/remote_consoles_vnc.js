window.$ = window.jQuery = require('jquery');
require('@novnc/novnc');
require('../oldjs/i18n.js');
require('../oldjs/remote_console.js');

$(function() {
  var host = window.location.hostname;
  var encrypt = window.location.protocol === 'https:';
  var port = encrypt ? 443 : 80;
  if (window.location.port) {
    port = window.location.port;
  }

  // noVNC requires an empty canvas item
  var canvas = document.createElement('canvas');
  $('#remote-console').append(canvas);

  var vnc = new RFB({
    target: canvas,
    encrypt: encrypt,
    true_color: true,
    local_cursor: true,
    shared: true,
    view_only: false,
    onUpdateState: function(_a, state, _b, msg) {
      if (['normal', 'loaded'].indexOf(state) >= 0) {
        $('#connection-status').removeClass('label-danger label-warning').addClass('label-success');
        $('#connection-status').text(__('Connected'));
      } else if (state === 'disconnected') {
        $('#connection-status').removeClass('label-success label-warning').addClass('label-danger');
        $('#connection-status').text(__('Disconnected'));
        console.error('VNC', msg);
      }
    },
  });

  vnc.connect(host, port, $('#remote-console').attr('data-secret'), $('#remote-console').attr('data-url'));

  $('#ctrlaltdel').on('click', function() {
    vnc.sendCtrlAltDel();
  });
});
