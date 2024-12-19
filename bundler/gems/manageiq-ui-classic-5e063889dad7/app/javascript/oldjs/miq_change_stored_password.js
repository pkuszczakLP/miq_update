/* global miqJqueryRequest */

window.changeStoredPassword = function(pfx, url) {
  var prefix = '';
  if (pfx.length > 1) {
    prefix = pfx + '_';
  }
  $('#' + prefix + 'change_stored_password').css('display', 'none');
  $('#' + prefix + 'cancel_password_change').css('display', 'block');
  $('#' + prefix + 'verify_group').css('display', 'block');
  $('#' + prefix + 'password').removeAttr('disabled');
  $('#' + prefix + 'verify').removeAttr('disabled');
  $('#' + prefix + 'password').val('');
  $('#' + prefix + 'verify').val('');
  $('#' + prefix + 'password').attr('placeholder', '');
  $('#' + prefix + 'verify').attr('placeholder', '');
  miqJqueryRequest(url + '?' + prefix + 'password' + '=' + '&' + prefix + 'verify' + '=');
  $('#' + prefix + 'password').focus();
}

window.cancelPasswordChange = function(pfx, url) {
  var storedPasswordPlaceholder = '●●●●●●●●';
  var prefix = '';
  if (pfx.length > 1) {
    prefix = pfx + '_';
  }
  $('#' + prefix + 'cancel_password_change').css('display', 'none');
  $('#' + prefix + 'change_stored_password').css('display', 'block');
  $('#' + prefix + 'verify_group').css('display', 'none');
  $('#' + prefix + 'password').attr('disabled', 'disabled');
  $('#' + prefix + 'verify').attr('disabled', 'disabled');
  $('#' + prefix + 'password').attr('placeholder', storedPasswordPlaceholder);
  $('#' + prefix + 'verify').attr('placeholder', storedPasswordPlaceholder);
  $('#' + prefix + 'password').val('');
  $('#' + prefix + 'verify').val('');
  miqJqueryRequest(url + '?' + prefix + 'password' + '=' + '&' + prefix + 'verify' + '=' + '&restore_password=true');
}
