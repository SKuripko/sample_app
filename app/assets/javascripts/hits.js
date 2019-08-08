  $(document).on('turbolinks:load', function () {
    loadHitRequestSettings();
  });

  function loadHitRequestSettings() {
    $('#channel').val(localStorage.channel);
    $('#date_from').val(localStorage.date_from);
    $('#date_to').val(localStorage.date_to);    
  }

  function saveHitRequestSettings() {
    localStorage.channel = $('#channel').val();
    localStorage.date_from = $('#date_from').val();
    localStorage.date_to = $('#date_to').val();
  }
