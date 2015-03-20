// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery-ui
//= require_tree .
//= require moment
//= require bootstrap-datetimepicker

$(document).ready(function(){
var $notifier = $('.notifier');
var notifierTimer;

	function notifie(message){
    clearTimeout(notifierTimer);
    initNotifierSuccess();
    $notifier.children('.notice-mess').html(message);
    destroyNotifier();
  }

  function error(mess) {
    clearTimeout(notifierTimer);
    initNotifierError();
    if(mess){
      $notifier.children('.notice-mess').html(mess);
    } else{
      $notifier.children('.notice-mess').html('Something went wrong, please repeat the action later!');
    }
    destroyNotifier();
  }

  function initNotifierSuccess(){
    $notifier.addClass('notifier-init notice-success').removeClass('notice-error');
    $notifier.fadeIn('fast');
  }

  function initNotifierError(){
    $notifier.addClass('notifier-init notice-error').removeClass('notice-success');
    $notifier.fadeIn('fast');
  }

  function destroyNotifier(){
    notifierTimer = setTimeout(function(){
      $notifier.fadeOut('slow');
    },2000);    
  }

  })