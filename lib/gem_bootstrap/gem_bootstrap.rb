module GemBootstrap
  class MainCLI < Thor
    register GemBootstrap::CLI,
             'generate',
             'generate',
             'Generate the starting template for CLI'

    desc 'usage', 'Display help screen'
    def usage
      generate_usage = <<-EOT

# Usage/Synopsis:
gem_bootstrap [GEM_NAME] -g, --github-id [GITHUB_ID] -e, --email [EMAIL] -a, --author [AUTHOR] --test-framework [FRAMEWORK]

# Create a gem name 'awesome_gem' with minitest as a testing framework (default)
gem_bootstrap awesome_gem -g awesome_developer -e cool@awesomedev.com -a 'John Guru II'

# Create a gem name 'awesome_gem' with rspec as a testing framework
gem_bootstrap awesome_gem -g awesome_developer -e cool@awesomedev.com -a 'John Guru II' -t rspec

      EOT
      puts generate_usage
    end

    default_task :usage
  end
end
