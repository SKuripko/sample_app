  $(document).on('turbolinks:load', function () {
    loadFareFamilySettings();
  });

  function loadFareFamilySettings() {
    $('#tid').val(localStorage.tid);
    $('#auth_key').val(localStorage.auth_key);
    $('#api_url').val(localStorage.api_url);    
  }

  function saveFareFamilySettings() {
    localStorage.api_url = $('#api_url').val();
    localStorage.tid = $('#tid').val();
    localStorage.auth_key = $('#auth_key').val()
  }


