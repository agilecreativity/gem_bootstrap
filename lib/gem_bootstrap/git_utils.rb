module GemBootstrap
  class GitUtils
    class << self
      # create new git repository from a given directory
      #
      # @param [String] base_dir the starting directory
      # @param [String] gem_name the name of the gem we are creating
      def create_git_project(base_dir, gem_name)
        base_dir = expand_path(base_dir)
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
        git_init(base_dir)
        git_add(base_dir, files)
      end

      # Run the `git init` on a given directory
      #
      # @param [String] base_dir the starting directory
      def git_init(base_dir)
        base_dir = expand_path(base_dir)
        # Note: need to be in the right directory for this to work
        Dir.chdir(base_dir)
        MiscUtils.shell(%w(git init) << base_dir)
      end

      # Add files and perform initial commit to the repository
      #
      # @param [String] base_dir the starting directory
      # @param [Array<String>] files list of files to be used
      def git_add(base_dir, files)
        base_dir = expand_path(base_dir)
        Dir.chdir(base_dir) do
          git = Grit::Repo.new(File.expand_path('.'))
          files.each do |file|
            git.add(file)
          end
          git.commit_index('Initial commit')
        end
      end

      private

      def expand_path(base_dir)
        raise "Invalid directory name `{base_dir}`" if base_dir.nil? || !File.directory?(File.new(base_dir))
        File.expand_path(base_dir)
      end
    end
  end
end
