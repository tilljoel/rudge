require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'minitest/unit'
require 'minitest/mock'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/setup'

MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
#MiniTest::Reporters.use! MiniTest::Reporters::DefaultReporter.new

#MiniTest::Unit.runner =  MiniTest::Unit.new
#MiniTest::Unit.runner.reporters << MiniTest::Reporters::ProgressReporter.new
#MiniTest::Unit.runner.reporters << MiniTest::Reporters::DefaultReporter.new
#MiniTest::Unit.runner.reporters << MiniTest::Reporters::SpecReporter.new

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rudge'

class MiniTest::Unit::TestCase
end

MiniTest::Unit.autorun
