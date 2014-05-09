require_relative '<%= name %>/version'
require_relative '<%= name %>/logger'
require_relative '<%= name %>/<%= name %>'
require_relative '<%= name %>/cli'
require_relative '<%= name %>/core_ext/hash/keys'
include <%= MiscUtils.camel_case(name) %>
