module <%= MiscUtils.camel_case(name) %>
  CustomError = Class.new(StandardError)
  # creat the main logic if applicable
  class << self
    # main helper method
    def helper
      puts 'FYI: <%= MiscUtils.camel_case(name) %>::helper()'
    end
  end
end
