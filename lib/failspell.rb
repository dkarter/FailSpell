require "failspell/version"
require 'highline/import'
require 'colorize'
require 'JSON'

module FailSpell
end

file = '/Users/dkarter/Dropbox/Developer/failspell/result.json'
file_contents = File.read(file)
parser = FailSpell::RspecJsonParser.new(file_contents)
parser.parse


