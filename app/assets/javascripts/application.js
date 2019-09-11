// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require turbolinks
//= require bootstrap-datepicker
//= require select2
//= require datatables
//= require ace-rails-ap
//= require_tree .

$(document).on('turbolinks:load', function(){
  $('form input[name="segments[1][from]"]').prop("disabled", true);
  $('form input[name="segments[1][to]"]').prop("disabled", true);
  $('form input[name="segments[1][date]"]').prop("disabled", true);
  $("#agree").change(function(){
      if($(this).prop("checked") == true){
          $('form input[name="segments[1][from]"]').prop("disabled", false);
          $('form input[name="segments[1][to]"]').prop("disabled", false);
          $('form input[name="segments[1][date]"]').prop("disabled", false);
      }
      else if($(this).prop("checked") == false){
          $('form input[name="segments[1][from]"]').prop("disabled", true);
          $('form input[name="segments[1][to]"]').prop("disabled", true);
          $('form input[name="segments[1][date]"]').prop("disabled", true);
      }
    });
  });
$(document).ready(function(){
  $('.datepicker').datepicker();
});
$(document).on('turbolinks:load', function() { 
  var passengersCount = $('.passengers_fields .passenger').size();
  $('.AddPassenger').click(function(e) {
    event.preventDefault();
    $('.passengers_fields').append('<div class="form-group row passenger_' + passengersCount + '" id=pass_'+passengersCount+'>' + 
        '<div class="col-lg-3"><label for="inputPassengerType">Passenger type</label><select class="form-control form-control-sm" name="passengers[' + passengersCount + '][age]" id="age_'+ passengersCount + '"><option value="adt">Adult</option><option value="chd">Child</option><option value="inf">Infant</option></select></div>' + 
        '<div class="col-lg-3"><label for="ValidationFirstName">First name</label><input type="text" name="passengers[' + passengersCount + '][firstname]" id="firstname_'+ passengersCount +'" class="form-control" placeholder="First name" required></div>' + 
        '<div class="col-lg-3"><label for="ValidationLastName">Last name</label><input type="text" name="passengers[' + passengersCount + '][lastname]" id="lastname_' + passengersCount + '" class="form-control" placeholder="Last name" required></div>' + 
        '<div class="col-lg-3"><label for="MiddleName">Middle name</label><input type="text" name="passengers[' + passengersCount + '][middlename]" id="middlename_' + passengersCount + '" class="form-control" placeholder="Middle name"></div>' + 
        '<div class="col-lg-3"><label for="inputGender">Gender</label><select class="form-control form-control-sm" name="passengers[' + passengersCount + '][gender]" id="gender_' + passengersCount + '" onchange="SwitchPassenger('+passengersCount+')"><option value="M">Male</option><option value="F">Female</option></select></div>' + 
        '<div class="col-lg-3"><label for="ValidationFirstName">Birthday</label><input type="text" name="passengers[' + passengersCount + '][birthdate]" id="birthdate_'+ passengersCount + '" class="form-control" placeholder="Birthday" required></div>' + 
        '<div class="col-lg-3"><label for="DocNum">Docnum</label><input type="text" name="passengers[' + passengersCount + '][docnum]" id="docnum_'+ passengersCount + '" class="form-control" placeholder="Doc number"></div>' + 
        '<div class="col-lg-3"><label for="Citizwnship">Citizenship</label><input type="text" name="passengers[' + passengersCount + '][citizen]" id="citizen_'+ passengersCount + '" class="form-control" placeholder="Citiewnship" value="RU"></div>' + 
        '<div class="col-lg-3"><label for="inputDocType">Doc type</label><select class="form-control form-control-sm" name="passengers[' + passengersCount + '][doctype]" id="doctype_'+ passengersCount + '"><option value="C">Паспорт РФ</option><option value="P">Загран паспорт</option><option value="B">Свидетельство о рождении</option><option value="A">Иностранный документ</option></select></div>' + 
        '<div class="col-lg-3"><label for="PassengerPhone">Phone</label><input type="text" name="passengers[' + passengersCount + '][phone]" id="phone_'+ passengersCount + '" class="form-control" placeholder="Passenger phone"></div>' + 
        '<div class="col-lg-3"><label for="PassengerEmail">Email</label><input type="text" name="passengers[' + passengersCount + '][email]" id="email_'+ passengersCount + '" class="form-control" placeholder="Passenger email"></div>');
        PassGenerator(GetPassName('M'), GetPassBirthDate('adt'), GenPassNum('C'),passengersCount);
        passengersCount++;
  });
    $('.removePassenger').click(function(event) {
      event.preventDefault();
      console.log(passengersCount)

      --passengersCount;
      console.log(passengersCount)
      $(".passenger_"+passengersCount).remove();
      return false;
    })  
});

$(document).on('turbolinks:load', function() {
  $('.AddSegments').click(function(e) {
    event.preventDefault();
    var segmentsCount = $('.segments_fields .segment').size();
    $('.segments_fields').append('<div class="form-group row segment">' + 
        '<div class="col-md-4 from['+ segmentsCount +']"><label for="validationDeparture">Departure</label><input type="text" name="segments[' +segmentsCount +'][from]" id="segments[' +segmentsCount +'][from]" class="from form-control" placeholder="Deparute iata" value="" required></div>' + 
        '<div class="col-md-4 ['+ segmentsCount +']"><label for="validationArrival">Arrival</label><input type="text" name="segments[' +segmentsCount +'][to]" id="segments[' +segmentsCount +'][to]" class="to form-control" placeholder="Arrival iata" value="" required></div>' + 
        '<div class="col-md-4 input-prepend date['+ segmentsCount +']"><label for="date">Date</label><input type="text" name="segments[' +segmentsCount +'][date]" id="segments[' +segmentsCount +'date" class="date form-control" data-provide="datepicker" data-date-format="dd-mm-yyyy"></div>' +
        '<div class="col-md-12"><button type="button" class="btn btn-primary btn-xs removeSegment">Remove segment</button></div>' + 
        '</div>');
    $('.removeSegment').click(function(e) {
      $(this).parent().parent().remove();
    })
  });    
});

anychart.onDocumentReady(function() {
    // create column chart
    var chart = anychart.column();

    // set chart title
    chart.title('Booking and payment statistics'); 

    // set chart data
    chart.data([
        {x: 'Hits',  value: gon.hits.total.hits},
        {x: 'Books', value: gon.hits.total.book},
        {x: 'Pays',  value: gon.hits.total.pays}
    ]);

    // set container id for the chart
    chart.container('conversion');

    // initiate chart drawing
    chart.draw();
});


$(document).ready(function() {
    $('#channel').select2({
    placeholder: '',
    });
});

$(document).ready(function() {
    $('#api_url').select2({
        placeholder: '',
    });
});

anychart.onDocumentReady(function () {
    // create pie chart with passed data
  var data = [
    {x: "TUA", value: gon.hits.total.provider_hits.TUA},
    {x: "VTRIP", value: gon.hits.total.provider_hits.VTRIP},
    {x: "DTRIP", value: gon.hits.total.provider_hits.DTRIP},
    {x: "SFA", value: gon.hits.total.provider_hits.SFA}
  ];  

  // create a pie chart and set the data
  chart = anychart.pie(data);  

  chart.title('Hit statistics by provider'); 
  /* set the inner radius
  (to turn the pie chart into a doughnut chart)*/
  chart.innerRadius("50%");  

  // set the container id
  chart.container("hits");  
  chart.legend().position("left");
  chart.legend().itemsLayout("vertical");  

  // initiate drawing the chart
  chart.draw();
});


anychart.onDocumentReady(function () {
    // create pie chart with passed data
  var data = [
    {x: "TUA", value: gon.hits.total.provider_books.TUA},
    {x: "VTRIP", value: gon.hits.total.provider_books.VTRIP},
    {x: "DTRIP", value: gon.hits.total.provider_books.DTRIP},
    {x: "SFA", value: gon.hits.total.provider_books.SFA}
  ];  

  // create a pie chart and set the data
  chart = anychart.pie(data);  

  chart.title('Book statistics by provider'); 
  /* set the inner radius
  (to turn the pie chart into a doughnut chart)*/
  chart.innerRadius("50%");  

  // set the container id
  chart.container("books");
  chart.legend().position("left");
  chart.legend().itemsLayout("vertical");  

  // initiate drawing the chart
  chart.draw();
});

anychart.onDocumentReady(function () {
    // create pie chart with passed data
  var data = [
    {x: "TUA", value: gon.hits.total.provider_pays.TUA},
    {x: "VTRIP", value: gon.hits.total.provider_pays.VTRIP},
    {x: "DTRIP", value: gon.hits.total.provider_pays.DTRIP},
    {x: "SFA", value: gon.hits.total.provider_pays.SFA}
  ];  

  // create a pie chart and set the data
  chart = anychart.pie(data);  

  chart.title('Pay statistics by provider'); 
  /* set the inner radius
  (to turn the pie chart into a doughnut chart)*/
  chart.innerRadius("50%");  

  // set the container id
  chart.container("pays");
  chart.legend().position("left"); 
  chart.legend().itemsLayout("vertical");   

  // initiate drawing the chart
  chart.draw();
});


$(document).ready(function() {
  $('#results').DataTable();
});

$(document).ready(function() {
    if ($("#js").lentgh) {
        var editor = ace.edit('js');
        editor.setTheme('ace/theme/textmate');
        editor.session.setMode('ace/mode/ruby');
        editor.setOptions({
            readOnly: true,
            highlightActiveLine: false,
            highlightGutterLine: false
        });
    }
});
