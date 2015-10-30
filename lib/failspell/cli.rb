require 'thor'
require 'failspell/spec_runner'
require 'failspell/rspec_json_parser'
require 'failspell/spec_menu'

module FailSpell
  class CLI < Thor
    package_name 'FailSpell'
    default_task :run_suite
    map 'rf' => :rerun_failed

    desc 'run_suite', 'Run RSpec test suite'
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

      failed_specs = FailSpell::RspecJsonParser.new(File.read(file)).parse

      FailSpell::SpecMenu.show(failed_specs) do |spec_path|
        # move to outside so it's handled by block
        puts "Re-Running rspec #{spec_path}".yellow
        SpecRunner.new(spec_path).run
      end
    end
  end
end

