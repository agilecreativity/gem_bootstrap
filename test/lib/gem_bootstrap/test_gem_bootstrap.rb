require_relative "../../test_helper"
require "fileutils"
describe GemBootstrap do
  context "#dummy_test" do
    it "must pass the simple test" do
      "string".wont_be_nil
    end
  end
end
