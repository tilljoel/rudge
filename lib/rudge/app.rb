require_relative 'exceptions'

module Rudge

  class App
    class RuleHandler;
      def initialize(set)
      end
      def rules
      end
    end
    class Judge
      def initialize(rules, offence_handler)
      end
    end
    class OffenceHandler;end
    class ReportHandler
      def initialize(offence_handler)
      end
    end

    attr_reader :settings
    attr_reader :files

    def initialize(options,
                   configuration,
                   rules = nil,
                   offence_handler = nil,
                   judge = nil,
                   report_handler = nil)

      raise_error_on_invalid_input(options, configuration)
      @settings = configuration
      @files = options.files
      @judge = judge
      @rules = rules
      @offence_handler = offence_handler
      @report_handler = report_handler
    end

    def run
      puts "running"
    rescue Exception => exp
      re_raise_as(RudgeException, exp)
    end

    def re_raise_as(exp_klass, exp)
      p exp.backtrace
      if exp.is_a? exp_klass
        raise exp
      else
        raise exp_klass, exp.to_s
      end
    end

    private

    #FIXME move out
    def read_content_from_file(filename)
      File.open(filename, 'rb') { |f| f.read }
    end

    def rules
      @rules ||= RuleHandler.new(settings).rules
    end

    def offence_handler
      @offence_handler ||= OffenceHandler.new
    end

    def judge
      @judge ||= Judge.new(rules, offence_handler)
    end

    def report_handler
      @report_handler ||= ReportHandler.new(offence_handler)
    end

    def raise_error_on_invalid_input(opts, conf)
      raise RudgeArgumentError, "invalid opts" if opts.nil? || opts.invalid?
      raise RudgeArgumentError, "invalid conf" if conf.nil? || conf.invalid?
    rescue NoMethodError
      raise RudgeArgumentError, "does not respond to valid?/invali?"
    end
  end
end


