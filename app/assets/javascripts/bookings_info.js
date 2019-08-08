  $(document).on('turbolinks:load', function () {
    loadBookInfoSettings();
  });

  function loadBookInfoSettings() {
    $('#billing').val(localStorage.billing);
    $('#signature').val(localStorage.signature);
    $('#auth_key').val(localStorage.auth_key);
    $('#api_url').val(localStorage.api_url);    
  }

  function saveBookInfoSettings() {
    localStorage.api_url = $('#api_url').val();    
    localStorage.billing = $('#billing').val();
    localStorage.signature = $('#signature').val();
    localStorage.auth_key = $('#auth_key').val()
  }


