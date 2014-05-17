module <%= MiscUtils.camel_case(name) %>
  CustomError = Class.new(StandardError)
  class << self
    # main helper method
    def helper
      puts 'FYI: <%= MiscUtils.camel_case(name) %>::helper()'
    end
  end
end
