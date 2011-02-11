$(document).ready(function(){
  $('.datepicker').each(function(){
    var options = { minDate:      $(this).attr('data-mindate'),
                    maxDate:      $(this).attr('data-maxdate'),
                    showAnim:     $(this).attr('data-showanim'),
                    changeMonth:  $(this).attr('data-changemonth'),
                    changeYear:   $(this).attr('data-changeyear')};

    var defaults = jQuery.extend({
                                  showAnim: 'drop',
                                  changeMonth: false,
                                  changeYear: false,
                                  yearRange: 'c-100:c' // today - 100 years
                                  }, options)

    $(this).datepicker(defaults);
  });
});
