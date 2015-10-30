$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec'
require 'fakefs/safe'
require 'fakefs/spec_helpers'
require 'failspell'

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true
end
