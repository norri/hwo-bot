{exec} = require 'child_process'
task 'build', 'Build project from src/*.coffee to js/*.js and test/*.coffee to test/js/*.js', ->
  exec 'coffee --compile --output js/ src/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
  exec 'coffee --compile --output test/js/ test/', (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr
task 'test', 'Run mocha tests', ->
  exec 'mocha --compilers coffee:coffee-script', (err, stdout, stderr) ->
  	throw err if err
  	console.log stdout + stderr
