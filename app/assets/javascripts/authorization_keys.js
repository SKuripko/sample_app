  $(document).on('turbolinks:load', function () {
    loadSettings();
  });

  function loadSettings() {
    $('#login').val(localStorage.login);
    $('#api_url').val(localStorage.api_url);
  }

  function saveSettings() {
    localStorage.login = $('#login').val();
    localStorage.api_url = $('#api_url').val();
  }
