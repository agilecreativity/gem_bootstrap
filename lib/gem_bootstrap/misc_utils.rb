require "open3"
module GemBootstrap
  class MiscUtils
    CustomError = Class.new(StandardError)

    class << self
      # Receives a string and convert it to snake case.
      # SnakeCase returns snake_case.
      #
      # @param [String] str the input string
      def snake_case(str)
        return str.downcase if str =~ /^[A-Z_]+$/
        str.gsub(/\B[A-Z]/, '_\&').squeeze("_") =~ /_*(.*)/
        $+.downcase
      end

      # Receives a string and convert it to camel case.
      # camel_case returns CamelCase.
      #
      # @param [String] str the input string
      def camel_case(str)
        return str if str !~ /_/ && str =~ /[A-Z]+.*/
        str.split("_").map { |i| i.capitalize }.join
      end

      # List files base on some extension
      def files(args = {})
        opts = {
          base_dir: Dir.pwd,
          recursive: false,
          exts: [],
          non_exts: []
        }.merge(args)

        base_dir = opts[:base_dir]
        fail CustomError, "The directory #{base_dir} is not valid or or not readable!" unless File.exist?(base_dir)

        wildcard = opts[:recursive] ? "**" : ""
        exts     = opts[:exts]
        non_exts = opts[:non_exts]

        file_with_extension    = Dir.glob(File.join(base_dir, wildcard, "*.{#{exts.join(",")}}"))
        file_with_no_extension = no_extension_files(base_dir, wildcard, non_exts)

        (file_with_extension + file_with_no_extension).sort
      end

      # List files that do not have the extension
      #
      # @return list of files that does not have any extension
      def no_extension_files(base_dir, wildcard, non_exts = [])
        list = []
        unless non_exts.empty?
          list = Dir.glob(File.join(base_dir, wildcard, "{#{non_exts.join(",")}}"))
        end
        list
      end

      # Wrapper function to call the 'popen3' and return the result
      #
      # @param [Array<String>] commands list of command
      # @return [String] result of the command as the string
      def shell(commands = [])
        begin
          command = commands.join(" ")
          stdin, _stderr, _status = Open3.capture3(command)
        rescue => e
          raise "Problem processing #{command}, #{e.message}"
        end
        stdin
      end
    end
  end
end
