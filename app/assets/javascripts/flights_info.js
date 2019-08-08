  $(document).on('turbolinks:load', function () {
    loadFlightSettings();
  });

  function loadFlightSettings() {
    $('#tid').val(localStorage.tid);
    $('#auth_key').val(localStorage.auth_key);
    $('#api_url').val(localStorage.api_url);    
  }

  function saveFlightSettings() {
    localStorage.tid = $('#tid').val();
    localStorage.auth_key = $('#auth_key').val()
    localStorage.api_url = $('#api_url').val();    
  }


