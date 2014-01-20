#= require application
#= require_tree .
#= require_self
 
@exists = (selector) ->
  !!find(selector).length

document.write('<div id="ember-testing-container"><div id="ember-testing"></div></div>');

WorkoutWars.rootElement = '#ember-testing';
WorkoutWars.setupForTesting();
WorkoutWars.injectTestHelpers();