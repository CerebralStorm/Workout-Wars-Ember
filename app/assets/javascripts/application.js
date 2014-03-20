// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require handlebars
//= require ember
//= require ember-data
//= require ember-validations
//= require ember-facebook
//= require ember-easyform
//= require ember-calendar
//= require_self
//= require workout_wars
//= require moment
//= require highcharts

WorkoutWars = Ember.Application.createWithMixins(Ember.Facebook);
WorkoutWars.set('appId', '167797983412231');
WorkoutWars.deferReadiness();

//= require_tree .
