module Rudge

  class ConfigurationHandler
    def initialize(conf)
    end

    def configuration
      Configuration.new("FIXME")
    end
  end

  class Configuration

    def initialize(conf)
    end

    def valid?
      true
    end

    def invalid?
      !valid?
    end
  end
end
