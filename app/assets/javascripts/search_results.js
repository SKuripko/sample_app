  $(document).on('turbolinks:load', function () {
    loadSearchResult();
  });

  function loadSearchResult() {
    $('#sro').val(localStorage.sro);
    $('#auth_key').val(localStorage.auth_key);
    $('#api_url').val(localStorage.api_url);    
  }

  function saveSearchResult() {
    localStorage.sro  = $('#sro').val();
    localStorage.auth_key = $('#auth_key').val();
    localStorage.api_url = $('#api_url').val();    
  }


