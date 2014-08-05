require 'bundler'
Bundler.require

$LOAD_PATH << '.'

require 'metriks'
require 'metriks/reporter/librato_metrics'
reporter = Metriks::Reporter::LibratoMetrics.new(ENV['LIBRATO_EMAIL'], ENV['LIBRATO_TOKEN'])
reporter.start
require './stats.rb' # TODO: Move it!
require './app'
run Stats.new(App)
