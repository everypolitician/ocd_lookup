# OcdLookup

Convert a place name to an OCD ID.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ocd_lookup', git: 'https://github.com/everypolitician/ocd_lookup', branch: 'master'
```

And then execute:

    $ bundle

## Usage

```ruby
lookup = OcdLookup::DivisionId.new([{ id: 'ocd-division/country:au/state:nsw', name: 'New South Wales' }])
lookup.find(state: 'New South Wales')
# => "ocd-division/country:au/state:nsw"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/ocd_lookup.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
