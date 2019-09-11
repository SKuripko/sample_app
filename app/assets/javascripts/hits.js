  $(document).on('turbolinks:load', function () {
    loadHitRequestSettings();
  });

  function loadHitRequestSettings() {
    $('#select2-channel-container').val(localStorage.channel);
    $('#hit_date_from').val(localStorage.date_from);
    $('#hit_date_to').val(localStorage.date_to);    
  }

  function saveHitRequestSettings() {
    localStorage.channel = $('#channel').val();
    localStorage.date_from = $('#hit_date_from').val();
    localStorage.date_to = $('#hit_date_to').val();
  }
