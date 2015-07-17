require 'active_support'
require 'active_support/core_ext'
require 'thor'
require '<%= name %>/version'
require '<%= name %>/<%= name %>'
require '<%= name %>/cli'
include <%= MiscUtils.camel_case(name) %>
