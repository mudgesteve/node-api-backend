/*
 * Example REPL server
 * Take in the word "fizz" and log out "buzz"
 *
 */
// -- Note to self!
// REPL means
// Read
// Evaluate
// Print
// Loop

//------------------------------
// Dependencies
const { endianness } = require('os');
var repl = require('repl');

// Start the REPL
repl.start({
  prompt: 'Type Something -- > ',
  eval: function(str){
    // Evaluation function for incoming inputs
    console.log("AT THE EVAL -- checking the input of --> ",str);
    // If the user said 'fizz', say 'buzz' back to them
    if(str.indexOf('fizz') > -1){
      console.log('buzz -- fizz must have been within the str you typed');
      console.log('<--- waiting ---> ' );
      console.log('Type Something -- > ' );
    }

    if(str.indexOf('exit') > -1){
      console.log('Exiting...');
      process.exit;
    }

  },
});
