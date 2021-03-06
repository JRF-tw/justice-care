// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require twitter/bootstrap
//= require chosen-jquery
//= require redactor-rails/redactor.min
//= require redactor-rails/plugins
//= require redactor-rails/langs/zh_tw
//= require redactor-rails/app_config

var ready_ran = 0;

$( document ).ready(function() {
  if (ready_ran == 1){
    return;
  }else{
    ready_ran = 1;
  }

  window.init_redactor();

  $('.chosen-select').chosen({
    search_contains: true,
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '400px'
  });
  $(".chosen-select").trigger('chosen:updated');
});