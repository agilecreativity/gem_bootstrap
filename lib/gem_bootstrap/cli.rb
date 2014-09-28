module GemBootstrap
  TEMPLATES_DIR = '../../templates'

  class CLI < Thor::Group
    include Thor::Actions
    argument :name

    class_option :github_id,
                 aliases: '-g',
                 desc: 'github profile id',
                 required: true
    class_option :author,
                 aliases: '-a',
                 desc: 'Full name of the author',
                 required: true
    class_option :email,
                 aliases: '-e',
                 desc: 'Email for github',
                 required: true
    class_option :test_framework,
                 default: 'minitest',
                 aliases: '-t',
                 desc: 'minitest or rspec',
                 required: false

    def self.source_root
      File.dirname(__FILE__)
    end

    # rubocop:disable MethodLength, LineLength
    def create_lib_file
      template "#{TEMPLATES_DIR}/README.md",             "#{name}/README.md"
      template "#{TEMPLATES_DIR}/CHANGELOG.md",          "#{name}/CHANGELOG.md"
      template "#{TEMPLATES_DIR}/dot_yardopts",          "#{name}/.yardopts"
      template "#{TEMPLATES_DIR}/dot_gitignore",         "#{name}/.gitignore"
      template "#{TEMPLATES_DIR}/Gemfile",               "#{name}/Gemfile"
      template "#{TEMPLATES_DIR}/dot_rubocop.yml",       "#{name}/.rubocop.yml"
      template "#{TEMPLATES_DIR}/bin/newgem",            "#{name}/bin/#{name}"
      template "#{TEMPLATES_DIR}/lib/newgem.rb",         "#{name}/lib/#{name}.rb"
      template "#{TEMPLATES_DIR}/lib/newgem/version.rb", "#{name}/lib/#{name}/version.rb"
      template "#{TEMPLATES_DIR}/lib/newgem/cli.rb",     "#{name}/lib/#{name}/cli.rb"
      template "#{TEMPLATES_DIR}/lib/newgem/newgem.rb",  "#{name}/lib/#{name}/#{name}.rb"

      test_framework = options.symbolize_keys[:test_framework]

      template "#{TEMPLATES_DIR}/Rakefile-#{test_framework}",  "#{name}/Rakefile"
      template "#{TEMPLATES_DIR}/Guardfile-#{test_framework}", "#{name}/Guardfile"
      template "#{TEMPLATES_DIR}/newgem-#{test_framework}.gemspec.tt", "#{name}/#{name}.gemspec"
    end
    # rubocop:enable all

    # rubocop:disable MethodLength, LineLength
    def copy_test_files
      if options.symbolize_keys[:test_framework] == 'minitest'
        template "#{TEMPLATES_DIR}/test/test_helper.rb",            "#{name}/test/test_helper.rb"
        template "#{TEMPLATES_DIR}/test/lib/newgem/test_newgem.rb", "#{name}/test/lib/#{name}/test_#{name}.rb"
      else
        template "#{TEMPLATES_DIR}/spec/spec_helper.rb",            "#{name}/spec/spec_helper.rb"
        template "#{TEMPLATES_DIR}/spec/lib/newgem/newgem_spec.rb", "#{name}/spec/lib/#{name}/#{name}_spec.rb"
      end
    end
    # rubocop:enable all

    def copy_licence
      copy_file '../../templates/MIT_LICENSE', "#{name}/LICENSE"
    end

    # Create the git project to store our generated code
    def create_git_project
      GemBootstrap::GitUtils.create_git_project(File.expand_path(name), name)
    end
  end
end
