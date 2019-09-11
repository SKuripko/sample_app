  $(document).on('turbolinks:load', function () {
    loadCancelBookSettings();
  });

  function loadCancelBookSettings() {
    $('#billing').val(localStorage.billing);
    $('#auth_key').val(localStorage.auth_key);
    $('#api_url').val(localStorage.api_url);    
  }

  function saveCancelBookSettings() {
    localStorage.api_url = $('#api_url').val();
    localStorage.billing = $('#billing').val();
    localStorage.auth_key = $('#auth_key').val();
  }


