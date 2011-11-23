fs = require 'fs'
exec = require('child_process').exec

build_dir = 'build'

task 'build:coffee', 'compiles the CoffeeScript files', ->
  fs.mkdir build_dir

  exec "coffee -b -p \"#{script}.js.coffee\" > \"#{build_dir}/#{script}.js\"" for script in [
    'direction'
    'column'
    'clause'
  ]

task 'build:parser', 'compiles the Jison parser', ->
  fs.mkdir build_dir

  exec "jison order_by.jison -o \"#{build_dir}/order_by.js\""

task 'build', 'builds all the files', ->
  exec 'cake build:coffee build:parser'

