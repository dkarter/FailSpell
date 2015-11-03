[![Downloads](https://img.shields.io/badge/downloads-183-green.svg)](https://rubygems.org/gems/failspell) [![Gem Version](https://badge.fury.io/rb/failspell.svg)](https://rubygems.org/gems/failspell) [![Build Status](https://travis-ci.org/dkarter/FailSpell.svg)](https://travis-ci.org/dkarter/FailSpell) [![Code Climate](https://codeclimate.com/github/dkarter/FailSpell/badges/gpa.svg)](https://codeclimate.com/github/dkarter/FailSpell) [![Test Coverage](https://codeclimate.com/github/dkarter/FailSpell/badges/coverage.svg)](https://codeclimate.com/github/dkarter/FailSpell/coverage)
# Failspell

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/failspell`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'failspell'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install failspell

## Usage

```
FailSpell commands:
  fspell help [COMMAND]           # Describe available commands or one specific command
  fspell rerun_failed [FILENAME]  # Re-Runs Failed Specs (alias rf)
  fspell run_suite                # Run RSpec test suite (alias rs/run with no args)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dkarter/failspell.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

