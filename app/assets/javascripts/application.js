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
//= require bootstrap
//= require turbolinks
//= require bootstrap-datepicker
//= require_tree .

      $(document).on('turbolinks:load', function(){
        $('form input[name="segments[1][from]"]').prop("disabled", true);
        $('form input[name="segments[1][to]"]').prop("disabled", true);
        $('form input[name="segments[1][date]"]').prop("disabled", true);
        $(".agree").click(function(){
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
        $('.AddPassenger').click(function(e) {
          event.preventDefault();
          var passengersCount = $('.passengers_fields .passenger').size();
          $('.passengers_fields').append('<div class="form-group row passenger">' + 
              '<div class="col-lg-3"><label for="inputPassengerType">Passenger type</label><select class="form-control form-control-sm" name="passengers[' + passengersCount + '][age]" id="SelectPassengerType"><option value="adt">Adult</option><option value="chd">Child</option><option value="inf">Infant</option></select></div>' + 
              '<div class="col-lg-3"><label for="ValidationFirstName">First name</label><input type="text" name="passengers[' + passengersCount + '][firstname]" class="form-control" placeholder="First name" required></div>' + 
              '<div class="col-lg-3"><label for="ValidationLastName">Last name</label><input type="text" name="passengers[' + passengersCount + '][lastname]" class="form-control" placeholder="Last name" required></div>' + 
              '<div class="col-lg-3"><label for="MiddleName">Middle name</label><input type="text" name="passengers[' + passengersCount + '][middlename]" class="form-control" placeholder="Middle name"></div>' + 
              '<div class="col-lg-3"><label for="inputGender">Gender</label><select class="form-control form-control-sm" name="passengers[' + passengersCount + '][gender]" id="SelectGender"><option value="M">Male</option><option value="F">Female</option></select></div>' + 
              '<div class="col-lg-3"><label for="ValidationFirstName">Birthday</label><input type="text" name="passengers[' + passengersCount + '][birthdate]" class="form-control" placeholder="Birthday" required></div>' + 
              '<div class="col-lg-3"><label for="DocNum">Docnum</label><input type="text" name="passengers[' + passengersCount + '][docnum]" class="form-control" placeholder="Doc number"></div>' + 
              '<div class="col-lg-3"><label for="Citizwnship">Citizenship</label><input type="text" name="passengers[' + passengersCount + '][citizen]" class="form-control" placeholder="Citiewnship" value="RU"></div>' + 
              '<div class="col-lg-3"><label for="inputDocType">Doc type</label><select class="form-control form-control-sm" name="passengers[' + passengersCount + '][doctype]" id="SelectDocType"><option value="C">Паспорт РФ</option><option value="P">Загран паспорт</option><option value="B">Свидетельство о рождении</option><option value="A">Иностранный документ</option></select></div>' + 
              '<div class="col-lg-3"><label for="PassengerPhone">Phone</label><input type="text" name="passengers[' + passengersCount + '][phone]" class="form-control" placeholder="Passenger phone"></div>' + 
              '<div class="col-lg-3"><label for="PassengerEmail">Email</label><input type="text" name="passengers[' + passengersCount + '][email]" class="form-control" placeholder="Passenger email"></div>' + 
              '<div class="col-lg-12"><button type="button" class="btn btn-primary removePassenger">Remove Passenger</button></div>' +
              '</div>');
          $('.removePassenger').click(function(event) {
            event.preventDefault();
            $(this).parent().parent().remove();
            return false;
          })
        });
      });

      $(document).on('turbolinks:load', function() {
        $('.AddSegments').click(function(e) {
          event.preventDefault();
          var segmentsCount = $('.segments_fields .segment').size();
          $('.segments_fields').append('<div class="form-group row segment">' + 
              '<div class="col-md-4"><label for="validationDeparture">Departure</label><input type="text" name="segments[' +segmentsCount +'][from]" class="form-control" placeholder="Deparute iata" value="" required></div>' + 
              '<div class="col-md-4"><label for="validationArrival">Arrival</label><input type="text" name="segments[' +segmentsCount +'][to]" class="form-control" placeholder="Arrival iata" value="" required></div>' + 
              '<div class="col-md-4 input-prepend"><label for="date">Date</label><input type="text" name="segments[' +segmentsCount +'][date]" class="form-control" data-provide="datepicker" data-date-format="dd-mm-yyyy"></div>' +
              '<div class="col-md-12"><button type="button" class="btn btn-primary btn-xs removeSegment">Remove segment</button></div>' + 
              '</div>');
          $('.removeSegment').click(function(e) {
            $(this).parent().parent().remove();
          })
        });    
      });
