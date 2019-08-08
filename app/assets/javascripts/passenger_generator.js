$(document).on('turbolinks:load', function () {
  PassGenerator(GetPassName('M'), GetPassBirthDate('adt'), GenPassNum('C'), '0');
});  

  function PassGenerator(data, age, docnum, passengersCount){
      // var passengersCount = $('.passengers_fields .passenger').size() -1;
      $("#firstname_"+passengersCount).val(data[0]);
      $("#lastname_"+passengersCount).val(data[1]);
      $("#middlename_"+passengersCount).val(data[2]);
      $("#docnum_"+passengersCount).val(GenPassNum('C'));
      $("#doctype_"+passengersCount).on('change', function(){
          $("#docnum_"+passengersCount).val(GenPassNum(this.value));
      });
      $("#birthdate_"+passengersCount).val(age);
      $("#age_"+passengersCount).on('change', function(){
           $("#birthdate_"+passengersCount).val(GetPassBirthDate(this.value));
      $("#phone_"+passengersCount).val($("#client_phone"));
      $("#email_"+passengersCount).val(client_email);
      })
  }      
  
  function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
  };

  function formatNumber(value) {
      return (value < 10) ? '0' + value : value;
  }  

  function translit(input) {
     input = input.toLowerCase();
      var map = {
    "а": "a","б": "b","в": "v","ґ": "g","г": "g","д": "d","е": "e","ё": "e","э": "e","ж": "zh",
    "з": "z","и": "i","і": "i","ї": "yi","й": "i","к": "k","л": "l","м": "m","н": "n","о": "o",
    "п": "p","р": "r","с": "s","т": "t","у": "u","ф": "f","х": "h","ц": "c","ч": "ch","ш": "sh",
    "щ": "sh","ъ": "","ы": "i","ь": "","э": "e","ю": "yu","я": "ya"};
      result = ""
      for (var i = 0; i < input.length; i++) {
          if (typeof(map[input[i]]) != 'undefined') {
              result += map[input[i]];
          } else {
              result += input[i];
          }
      }
      return result;
  }  

  function getRandomDay() {
          var randMonth = Math.floor(Math.random() * (12)) + 1;
          var randDate = Math.floor(Math.random() * ((32 - new Date(2019, randMonth, 32).getDate()))) + 1
      return formatNumber(randDate)+'.'+formatNumber(randMonth);
  }
      
  function GetPassBirthDate(age){
      switch(age){
              case 'adt' : 
                   DateStr =  getRandomDay() + '.' + (Math.floor(Math.random() * ((new Date().getFullYear()-22) - 1970 + 1)) + 1970); 
              break;
              case 'chd' : 
                   DateStr =  getRandomDay() + '.' + (Math.floor(Math.random() * ((new Date().getFullYear()-3) - 2010 + 1)) + 2010); 
              break;
              case 'inf' : 
                   DateStr =  getRandomDay() + '.' + (new Date().getFullYear()-1); 
              break;
          }
      return DateStr;   
  }  

  function GenPassNum(docnum){
      var id = event.target.id;
      var doc_num = '';
           switch($("#" + id).val()) {
              case 'C':
                doc_num = Math.floor(Math.random() * (9999999999 - 1234567891));
              break;
              case 'P':
                doc_num = Math.floor(Math.random() * (999999999 - 123456789));
              break;
              case 'B':
                doc_num = 'IVЯЯ' + Math.floor(Math.random() * (999999 - 123456));
              break;
              default:
                doc_num = Math.floor(Math.random() * (9999999999 - 1234567891));
              break;                   
           }
           return doc_num;
  } 

  function GetPassName(type){
    var data = [];
    var obj = PassDataObj(type);
    for(keys in obj) {
             var l = translit(obj[keys][getRandomInt(0, obj[keys].length-1)]);
             data.push(l[0].toUpperCase() + l.slice(1));
         }
   return data;
    }


  function SwitchPassenger(n) {
    var passenger = GetPassName(this.value);
      $("#firstname_" + n).val(passenger[0]);
      $("#lastname_" + n).val(passenger[1]);
      $("#middlename_" + n).val(passenger[2]);
  }