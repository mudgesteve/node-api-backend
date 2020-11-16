/*
 * Async Hooks Example
 *
 *
 */
// Note to self: these hooks came HELP with Async operations to debug
// Another way to debug a specific Async operation
// Just tie this to existing code
// This example creates its own async function to demo what it does and how it works
// run in console node misc/asyncHooks.js
// USE ctrl C to stop it quickly


// Dependencies
var async_hooks = require('async_hooks');
var fs = require('fs');

// Target execution context
var targetExecutionContext = false;
var numTimes = 0;

// Write an arbitrary async function
var whatTimeIsIt = function(callback){

  setInterval(function(){
    if(numTimes > 5) {
      fs.writeSync(1,"Interval has run more than 5 times exiting "+async_hooks.executionAsyncId()+"\n\n\n");
      process.exit(async_hooks.executionAsyncId());
    } else {
      fs.writeSync(1,`When the setInterval runs, ${numTimes} the execution context is `+async_hooks.executionAsyncId()+"\n");
      callback(Date.now());
      numTimes++;
    }
  },1000);
  
};

// Call that function
whatTimeIsIt(function(time){
  fs.writeSync(1,"The time is "+time+"\n");
});

// Hooks -- NOTE: careful about using console.logs in hooks that are set on an interval
// as this could create an endless loop
var hooks = {
  init(asyncId, type, triggerAsyncId, resource){
    fs.writeSync(1,"Hook init "+asyncId+"\n");
  },
  before(asyncId){
    fs.writeSync(1,"Hook before "+asyncId+"\n");
  },
  after(asyncId){
    fs.writeSync(1,"Hook after "+asyncId+"\n\n");
  },
  destroy(asyncId){
    fs.writeSync(1,"Hook destroy "+asyncId+"\n");
  },
  promiseResolve(asyncId){
    fs.writeSync(1,"Hook promiseResolve. "+asyncId+" This isnt applicable to our context, and should never get called here\n");
  }
};

// Create a new AsyncHook instance. All of these callbacks are optional.
var asyncHook =  async_hooks.createHook(hooks);
asyncHook.enable();
