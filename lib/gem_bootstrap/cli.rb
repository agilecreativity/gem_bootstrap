require "thor"
require "agile_utils"
require_relative "./misc_utils"
require_relative "./git_utils"
module GemBootstrap
  class CLI < Thor::Group
    using AgileUtils::HashExt
    using AgileUtils::BlankExt
    include Thor::Actions

    argument :name

    class_option :github_id,
                 aliases: "-g",
                 desc: "github profile id",
                 required: true
    class_option :author,
                 aliases: "-a",
                 desc: "Full name of the author",
                 required: true
    class_option :email,
                 aliases: "-e",
                 desc: "Email for github",
                 required: true
    class_option :'test-framework',
                 default: "minitest",
                 aliases: "-t",
                 desc: "minitest or rspec",
                 required: false

    def self.source_root
      File.dirname(__FILE__)
    end

    # rubocop:disable MethodLength, LineLength
    def create_lib_file
      template "../../templates/README.md",                                       "#{name}/README.md"
      template "../../templates/CHANGELOGS.md",                                   "#{name}/CHANGELOGS.md"
      template "../../templates/dot_yardopts",                                    "#{name}/.yardopts"
      template "../../templates/dot_gitignore",                                   "#{name}/.gitignore"
      template "../../templates/Gemfile",                                         "#{name}/Gemfile"
      template "../../templates/dot_rubocop.yml",                                 "#{name}/.rubocop.yml"
      template "../../templates/bin/newgem",                                      "#{name}/bin/#{name}"
      template "../../templates/lib/newgem.rb",                                   "#{name}/lib/#{name}.rb"
      template "../../templates/lib/newgem/version.rb",                           "#{name}/lib/#{name}/version.rb"
      template "../../templates/lib/newgem/logger.rb",                            "#{name}/lib/#{name}/logger.rb"
      template "../../templates/lib/newgem/cli.rb",                               "#{name}/lib/#{name}/cli.rb"
      template "../../templates/lib/newgem/newgem.rb",                            "#{name}/lib/#{name}/#{name}.rb"
      template "../../templates/Rakefile-#{options[:'test-framework']}",          "#{name}/Rakefile"
      template "../../templates/Guardfile-#{options[:'test-framework']}",         "#{name}/Guardfile"
      template "../../templates/newgem-#{options[:'test-framework']}.gemspec.tt", "#{name}/#{name}.gemspec"
    end
    # rubocop:enable all

    # rubocop:disable MethodLength, LineLength
    def copy_test_files
      if options[:'test-framework'] == 'minitest'
        template "../../templates/test/test_helper.rb",            "#{name}/test/test_helper.rb"
        template "../../templates/test/lib/newgem/test_newgem.rb", "#{name}/test/lib/#{name}/test_#{name}.rb"
      else
        template "../../templates/spec/spec_helper.rb",            "#{name}/spec/spec_helper.rb"
        template "../../templates/spec/lib/newgem/newgem_spec.rb", "#{name}/spec/lib/#{name}/#{name}_spec.rb"
      end
    end
    # rubocop:enable all

    def copy_licence
      copy_file "../../templates/MIT_LICENSE", "#{name}/LICENSE"
    end

    # Create the git project to store our generated code
    def create_git_project
      GemBootstrap::GitUtils.create_git_project(File.expand_path(name), name)
    end
  end
end
