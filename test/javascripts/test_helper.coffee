#= require application
#= require_tree .
#= require_self
 
@exists = (selector) ->
  !!find(selector).length

document.write('<div id="ember-testing-container"><div id="ember-testing"><meta name="current-user" content="{&quot;id&quot;:1,&quot;name&quot;:null,&quot;nickname&quot;:null,&quot;email&quot;:&quot;cody@12spokes.com&quot;,&quot;gender&quot;:null,&quot;address&quot;:null,&quot;phone&quot;:null,&quot;weight&quot;:null,&quot;height&quot;:null,&quot;age&quot;:null,&quot;admin&quot;:false,&quot;provider&quot;:null,&quot;uid&quot;:null,&quot;level&quot;:1,&quot;experience&quot;:0,&quot;next_level_experience&quot;:500,&quot;activity_ids&quot;:[],&quot;competition_activity_ids&quot;:[],&quot;competition_join_ids&quot;:[],&quot;competition_ids&quot;:[]}"></div></div>');
WorkoutWars.rootElement = '#ember-testing';
WorkoutWars.setupForTesting();
WorkoutWars.injectTestHelpers();