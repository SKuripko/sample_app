  $(document).on('turbolinks:load', function () {
    loadBookSettings();
  });

  function loadBookSettings() {
    $('#tid').val(localStorage.tid);
    $('#payer_name').val(localStorage.payer_name);
    $('#client_email').val(localStorage.client_email);
    $('#client_phone').val(localStorage.client_phone);
    $('#agent_affiliate_fee').val(localStorage.agent_affiliate_fee);
    $('#partner_affiliate_fee').val(localStorage.partner_affiliate_fee);
    $('#auth_key').val(localStorage.auth_key);
    $('#api_url').val(localStorage.api_url);    
  }

  function saveBookSettings() {
    localStorage.api_url = $('#api_url').val();    
    localStorage.tid = $('#tid').val();
    localStorage.payer_name = $('#payer_name').val();
    localStorage.client_email = $('#client_email').val();
    localStorage.client_phone = $('#client_phone').val();
    localStorage.agent_affiliate_fee = $('#agent_affiliate_fee').val();
    localStorage.partner_affiliate_fee = $('#partner_affiliate_fee').val();
    localStorage.auth_key = $('#auth_key').val()
  }