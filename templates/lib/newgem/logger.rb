require 'logger'
module <%= MiscUtils.camel_case(name) %>
  class << self
    attr_writer :logger
    # @return [Logger] the logger for the project
    def logger
      @logger ||= Logger.new STDOUT
    end
  end
end
