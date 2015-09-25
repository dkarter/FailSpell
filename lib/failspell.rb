# require "failspell/version"
require 'highline/import'
require 'colorize'
require 'JSON'

module FailSpell
  class RspecJsonParser
    attr_reader :input_str

    def initialize(input_str)
      @input_str = input_str
    end

    def parse
      results = JSON.parse(input_str)
      failed_specs = results['examples'].select { |e| e['status'] == 'failed' }

      failed_specs.each_with_index do |spec, i|
        say "(#{i+1}) #{spec['full_description']}"
        say "    #{spec['file_path']}:#{spec['line_number']}".red
      end

      prompt = "Which one would you like to re-run? (1-#{failed_specs.count})"
      rerun = ask(prompt, Integer)
      selected_spec = failed_specs[rerun - 1]
      spec_path = "#{selected_spec['file_path']}:#{selected_spec['line_number']}"
      puts "Re-Running rspec #{spec_path}".yellow
      SpecRunner.new(spec_path).run
    end
  end

end

file = '/Users/dkarter/Dropbox/Developer/failspell/result.json'
file_contents = File.read(file)
parser = FailSpell::RspecJsonParser.new(file_contents)
parser.parse


