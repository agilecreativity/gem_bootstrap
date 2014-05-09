require 'thor'
require_relative './cli'
module GemBootstrap
  class MainCLI < Thor
    # register(class_name, subcommand_alias, usage_list_string, description_string)
    register GemBootstrap::CLI,
             'generate',
             'generate',
             'Generate the starting template for CLI'

    desc 'usage', 'Display help screen'
    def usage
      generate_usage = <<-EOT
gem_bootstrap generate [GEM_NAME]
                       --github-id [GITHUB_ID]
                       --email [EMAIL]
                       --author [AUTHOR]
e.g. create a gem name 'awesome_gem'
gem_bootstrap generate awesome_gem
                       --github-id awesome_developer
                       --email cool@awesomedev.com
                       --author 'John Guru II'
      EOT

      help_text = <<-EOT
        gem_bootstrap help [COMMAND]  # Describe available commands or one specific command
        gem_bootstrap usage           # Display help screen
      EOT

      puts generate_usage
      puts help_text.gsub(/^\s+/, '')
    end

    default_task :usage
  end
end
