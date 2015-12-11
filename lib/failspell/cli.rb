require 'thor'
require 'failspell/spec_runner'
require 'failspell/rspec_json_parser'
require 'failspell/rspec_json_writer'
require 'failspell/spec_menu'

module FailSpell
  class CLI < Thor
    package_name 'FailSpell'
    default_task :run_suite
    map 'rf' => :rerun_failed
    map 'rs' => :run_suite

    desc 'run_suite', 'Run RSpec test suite (alias rs/run with no args)'
    def run_suite
      FailSpell::SpecRunner.new(ARGV[0] || 'spec').run_and_store_results
    end

    desc 'rerun_failed [FILENAME]', 'Re-Runs Failed Specs (alias rf)'
    def rerun_failed(file = nil)
      file ||= './tmp/failspell_last_run.json' # add .fspell

      unless File.exists?(file)
        puts "Cannot find result file: #{file}".red
        exit
      end

      parser = FailSpell::RspecJsonParser.new(File.read(file))
      failed_specs = parser.parse


      FailSpell::SpecMenu.show.call(failed_specs) do |spec_path|
        puts "Re-Running rspec #{spec_path}".yellow
        result = SpecRunner.new(spec_path).run

        writer = FailSpell::RspecJsonWriter.new(file_path: file)
        writer.update_spec_status(full_spec_path: spec_path, success: result)
        writer.save
      end
    end
  end
end

