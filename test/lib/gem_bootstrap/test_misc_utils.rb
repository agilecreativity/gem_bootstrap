require_relative '../../test_helper'
describe GemBootstrap do
  describe '#snake_case' do
    it 'handles camel case text properly' do
      MiscUtils.snake_case("someText").must_equal("some_text")
      MiscUtils.snake_case("SomeText").must_equal("some_text")
    end
    it 'handles string that does not start with lowercase' do
      MiscUtils.snake_case("Sometext").must_equal("sometext")
    end
  end
  describe '#camel_case' do
    it 'handles string with underscore' do
      MiscUtils.camel_case("some_text").must_equal("SomeText")
      MiscUtils.camel_case("_some_text").must_equal("SomeText")
    end
    it 'handles string without underscore' do
      MiscUtils.camel_case("html2pdf").must_equal("Html2pdf")
    end
  end
  describe '#files' do
    let :fixtures_dir do
      File.expand_path("../../../fixtures", __FILE__)
    end
    context 'non matching file' do
      it 'returns empty list by default' do
        MiscUtils.files.must_equal []
      end
      it 'returns empty list for non-matching files' do
        result = MiscUtils.files(base_dir: fixtures_dir,
                                exts: %w(invalid_extension),
                                recursive: true)
        result.must_be_empty
      end
    end
    context 'recursive' do
      it 'returns proper list of files' do
        result = MiscUtils.files(base_dir: fixtures_dir,
                                 exts: %w(txt),
                                 recursive: true)
        result.map! { |file| file.gsub(fixtures_dir, '') }
        result.must_equal ['/file1.txt', '/file2.txt', '/sub_dir/file3.txt', '/sub_dir/file4.txt']
      end
      it 'returns all files including one with no extension' do
        result = MiscUtils.files(base_dir: fixtures_dir,
                                 exts: %w(txt),
                                 non_exts: %w(file0),
                                 recursive: true)
        result.map! { |file| file.gsub(fixtures_dir, '') }
        result.must_equal ['/file0', '/file1.txt', '/file2.txt', '/sub_dir/file3.txt', '/sub_dir/file4.txt']
      end
    end
    context 'non-recursive' do
      it 'returns proper list of files' do
        result = MiscUtils.files(base_dir: fixtures_dir,
                                exts: %w(txt))
        result.map! { |file| file.gsub(fixtures_dir, '') }
        result.must_equal ['/file1.txt', '/file2.txt' ]
      end
    end
  end
end
