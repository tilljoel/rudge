require_relative 'command_line_handler'
require_relative 'configuration_handler'
require_relative 'app'

module Rudge
  class CommandLineApp

    def initialize

    end

    def run!
      options = CommandLineHandler.new(ARGV).options
      configuration = ConfigurationHandler.new("some/dir").configuration
      Rudge::App.new(options, configuration).run
    end
  end
end
