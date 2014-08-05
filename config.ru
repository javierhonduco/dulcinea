require 'bundler'
Bundler.require

$LOAD_PATH << '.'

require 'metriks'
require 'metriks/reporter/librato_metrics'
reporter = Metriks::Reporter::LibratoMetrics.new('javierhonduco@gmail.com', 'e0a75ca66677bf7c4643b7371924022799cb5ca8fe9bc9e6cee3bca7036723ee')
reporter.start
require './stats.rb' # TODO: Move it!
require './app'
run Stats.new(App)
