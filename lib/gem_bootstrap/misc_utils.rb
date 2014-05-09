module GemBootstrap
  class MiscUtils
    class << self
      # Receives a string and convert it to snake case.
      # SnakeCase returns snake_case.
      #
      # @param [String] str the input string
      def snake_case(str)
        return str.downcase if str =~ /^[A-Z_]+$/
        str.gsub(/\B[A-Z]/, '_\&').squeeze('_') =~ /_*(.*)/
        $+.downcase
      end

      # Receives a string and convert it to camel case.
      # camel_case returns CamelCase.
      #
      # @param [String] str the input string
      def camel_case(str)
        return str if str !~ /_/ && str =~ /[A-Z]+.*/
        str.split('_').map { |i| i.capitalize }.join
      end
    end
  end
end
