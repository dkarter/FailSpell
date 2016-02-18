[![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/failspell)](https://rubygems.org/gems/failspell) [![Gem Version](https://badge.fury.io/rb/failspell.svg)](https://rubygems.org/gems/failspell) [![Build Status](https://travis-ci.org/dkarter/FailSpell.svg)](https://travis-ci.org/dkarter/FailSpell) [![Code Climate](https://codeclimate.com/github/dkarter/FailSpell/badges/gpa.svg)](https://codeclimate.com/github/dkarter/FailSpell) [![Test Coverage](https://codeclimate.com/github/dkarter/FailSpell/badges/coverage.svg)](https://codeclimate.com/github/dkarter/FailSpell/coverage) [![Dependency Status](https://gemnasium.com/dkarter/FailSpell.svg)](https://gemnasium.com/dkarter/FailSpell)
# Failspell

Failspell is a test suite runner for rspec that simplifies the TDD workflow. To
illustrate, imagine the following pedestrian scenario:

You have a project with a fairly large test suite, you implement a feature using
TDD, the feature tests pass and you decide to run your test suite to make sure
there are no regression side effects.

Some 8 tests fail, bummer. Now you have to run each one individually to make
sure you fixed them and at the end you want to run the whole suite again to make
sure everything is green.

It's a long description but everyone who uses tmux and vim as their "IDE" knows
there are efficiencies that can be made.

FailSpell magically runs your suite for you and then only failing tests,
removing those that passed from the interactive menu.

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

To run failspell use

```sh
fspell --help
```

This will output the following:

```
FailSpell commands:
  fspell help [COMMAND]           # Describe available commands or one specific command
  fspell rerun_failed [FILENAME]  # Re-Runs Failed Specs (alias rf)
  fspell run_suite                # Run RSpec test suite (alias rs/run with no args)
```

Running `fspell` with no arguments will run your test suite in the current
project directory.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dkarter/failspell.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

