  $(document).on('turbolinks:load', function () {
    loadSearchSettings();
  });

  function loadSearchSettings() {
    $('#api_url').val(localStorage.api_url);    
    $('input[value="' + localStorage.agree + '"]').prop('checked', true);
    $('#adult').val(localStorage.adult);
    $('#child').val(localStorage.child);
    $('#infant').val(localStorage.infant);
    $('#include_airlines').val(localStorage.include_airlines);
    $('#exclude_gds').val(localStorage.exclude_gds);
    $('#SelectBookingClass').val(localStorage.SelectBookingClass);
    $('#auth_key').val(localStorage.auth_key);
    if (localStorage.segments != undefined){
      var segments = JSON.parse(localStorage.segments);
      $.each(segments, function(key, value) {
        $('#from_'+ key).val(value.from); 
        $('#to_'+ key).val(value.to);
        $('#date_' + key).val(value.date);
      });
    }
  }

  function saveSearchSettings() {
    var segments = [];
    $('.segment').each(function(key, value){
      if ($($('.from')[key]).val() == '' ){ return true; }
      var segment = {};
      segment.from = $($('.from')[key]).val();
      segment.to = $($('.to')[key]).val();
      segment.date = $($('.date')[key]).val();
      segments.push(segment);
    });
    localStorage.api_url = $('#api_url').val();
    localStorage.segments = JSON.stringify(segments);
    localStorage.agree = $('input[type=checkbox]:checked').val();;      
    localStorage.adult = $('#adult').val();
    localStorage.child = $('#child').val();
    localStorage.infant = $('#infant').val();
    localStorage.include_airlines = $('#include_airlines').val();
    localStorage.exclude_gds = $('#exclude_gds').val();
    localStorage.SelectBookingClass = $('#SelectBookingClass').val();    
    localStorage.auth_key = $('#auth_key').val();   
  }


