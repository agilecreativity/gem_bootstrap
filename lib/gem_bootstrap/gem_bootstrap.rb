require "thor"
require_relative "./cli"
module GemBootstrap
  class MainCLI < Thor
    register GemBootstrap::CLI,
             "generate",
             "generate",
             "Generate the starting template for CLI"

    desc "usage", "Display help screen"
    def usage
      generate_usage = <<-EOT

Usage/Synopsis:

$gem_bootstrap [GEM_NAME] -g, --github-id [GITHUB_ID] -e, --email [EMAIL] -a, --author [AUTHOR]

e.g. create a gem name 'awesome_gem'
$gem_bootstrap awesome_gem -g awesome_developer -e cool@awesomedev.com -a 'John Guru II'

      EOT
      # help_text = <<-EOT
      #   gem_bootstrap help [COMMAND]  # Describe available commands or one specific command
      #   gem_bootstrap usage           # Display help screen
      # EOT
      puts generate_usage
      # puts help_text.gsub(/^\s+/, '')
    end

    default_task :usage
  end
end
