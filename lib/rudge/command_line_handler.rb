#FIXME remove unneeded stuff here
require 'optparse'
require 'optparse/time'
require 'active_model'

module Rudge
  class CommandLineHandler

    # FIXME move constant as inparam
    PROGRAM_NAME = "rudge"
    PROGRAM_VERSION = [0,1,0]
    PROGRAM_RELEASE = "draft"

    attr_accessor :args

    def initialize(args)
      @args = args
    end

    def options
      options = CommandLineOptions.new

      # XXX Changes args, removes all options
      options = options_parse!(options, args)

      # XXX Changes args, removes everything thats a readable file
      options = argument_parse!(options, args)
    end

    private

    def argument_parse!(options, args)
      options.files = args.dup
      options
    end

    def options_parse!(options, args)
      options.verbose = false
      options.debug = false
      #FIXME Add error format to program
      #options.error_format = "FIXME"

      options_parser = OptionParser.new do |opts|

        opts.program_name = PROGRAM_NAME
        opts.version      = PROGRAM_VERSION
        opts.release      = PROGRAM_RELEASE
        opts.separator ""
        opts.separator "Specific options:"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options.verbose = v
        end

        opts.on("-d", "--[no-]debug", "Run with debug") do |d|
          options.debug = d
        end

        opts.separator ""
        opts.separator "Example usage: "
        opts.separator "    #{opts.program_name} **/*.rb"
        opts.separator ""
      end

      options_parser.parse!(args)
      return options

    rescue OptionParser::ParseError => err
      puts ""
      puts "Option Error: #{err}"
      puts ""
      puts options_parser
      puts ""
      abort("Try again, this did not work :)")
    end
  end

  class CommandLineOptions
    include ActiveModel::Validations
    attr_writer :files
    def files
      @files || []
    end
    validates :files, presence: true

    attr_accessor :verbose
    validates_inclusion_of :verbose, :in => [true, false]
    attr_accessor :debug
    validates_inclusion_of :debug, :in => [true, false]
    validate :files_must_be_readable

    def files_must_be_readable
      files.each do |file|
        unless File.readable?(file)
          errors.add(:files, "#{file} is not readable")
        end
      end
    end
  end
end
