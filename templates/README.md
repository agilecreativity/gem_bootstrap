## <%= MiscUtils.camel_case(name) %>

[![Gem Version](https://badge.fury.io/rb/<%= name %>.svg)][gem]
[![Dependency Status](https://gemnasium.com/<%= options[:github_id] %>/<%= name %>.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/<%= options[:github_id] %>/<%= name %>.png)][codeclimate]

[gem]: http://badge.fury.io/rb/<%= name %>
[gemnasium]: https://gemnasium.com/<%= options[:github_id] %>/<%= name %>
[codeclimate]: https://codeclimate.com/github/<%= options[:github_id] %>/<%= name %>

Here are list of gems that you can use with your project

- Test with either [Minitest][] or [Rspec][]
- Build with the power of [Thor][]
- Debug with [Pry][]
- Documentation with [Yard][]
- Style check with [Rubocop][]
- BDD/TDD with guard [Guard][]
- Initial git manipulation using [Grit][]

### Installation

Add this line to your application's Gemfile:

    gem '<%= name %>'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install <%= name %>

### Usage

Use as library try

```ruby
require '<%= name %>'
# then call the appropriate functions
```

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Thor]: https://github.com/erikhuda/thor
[Minitest]: https://github.com/seattlerb/minitest
[RSpec]: https://github.com/rspec
[Guard]: https://github.com/guard/guard
[Yard]: https://github.com/lsegal/yard
[Pry]: https://github.com/pry/pry
[Rubocop]: https://github.com/bbatsov/rubocop
[Grit]: https://github.com/mojombo/grit
