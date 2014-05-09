require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest-spec-context'
require 'pry'
require 'awesome_print'
require_relative '../lib/<%= name %>'
include <%= MiscUtils.camel_case(name) %>
