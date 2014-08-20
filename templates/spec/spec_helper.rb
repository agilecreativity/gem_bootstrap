require 'rspec'
require 'pry'
require 'awesome_print'
require_relative '../lib/<%= name %>'
include <%= MiscUtils.camel_case(name) %>
RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
end
