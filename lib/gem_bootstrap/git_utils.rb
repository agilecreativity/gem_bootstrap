require 'grit'

module GemBootstrap
  class GitUtils
    class << self
      # create new git repo from a given directory
      #
      # @param [String] base_dir the starting directory
      # @param [String] gem_name the name of the gem we are creating
      def create_git_project(base_dir, gem_name)
        base_dir = File.expand_path(base_dir) # so that it works with ~/codes/etc
        files = MiscUtils.files base_dir: base_dir,
                                non_exts: %w(Gemfile
                                             Rakefile
                                             Guardfile
                                             LICENSE
                                             .rubocop.yml
                                             .yardopts
                                             .gitignore) << gem_name,
                                exts: %w(md rb gemspec yml),
                                recursive: true
        git_init(base_dir: base_dir)
        git_add(files, base_dir: base_dir, gem_name: gem_name)
      end

      # Run the git init on a given directory
      #
      # @param [String] base_dir the base directory
      def git_init(options = {})
        current_dir = File.expand_path(options[:base_dir])
        base_dir = options[:base_dir] || Dir.pwd
        Dir.chdir(base_dir)
        MiscUtils.shell(%w(git init) << base_dir)
        Dir.chdir(current_dir)
      end

      def git_add(files, options = {})
        base_dir = File.expand_path(options[:base_dir])
        Dir.chdir(base_dir) do
          git = Grit::Repo.new(File.expand_path('.'))
          files.each do |file|
            # puts "Add '#{file}' to repository"
            git.add(file)
          end
          git.commit_index('Initial commit')
        end
      end
    end
  end
end
