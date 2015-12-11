require 'spec_helper'

describe FailSpell::CLI do
  context '#run_suite' do
    it 'calls spec runner' do
      expect_any_instance_of(FailSpell::SpecRunner).to receive(:run_and_store_results)
      described_class.new.run_suite
    end
  end

  context '#rerun_failed' do
    it 'updated successful tests in json file' do
      copy_file_path = '/tmp/test_rerun_failed_with_success.json'
      failed_test_path = './spec/lib/relateiq/list_spec.rb'
      failed_test_line_number = 78
      full_failed_spec_path = "#{failed_test_path}:#{failed_test_line_number}"
      FileUtils.cp('./spec/fixtures/result.json', copy_file_path)

      show_block = Proc.new do |failed_specs, &block|
        block.call(full_failed_spec_path)
      end

      allow(FailSpell::SpecMenu).to receive(:show).and_return(show_block)

      allow_any_instance_of(FailSpell::SpecRunner).to receive(:run).and_return(true)

      described_class.new.rerun_failed(copy_file_path)

      specs_json = JSON.parse(File.read(copy_file_path))['examples']
      newly_successful_spec = specs_json.find do |spec|
        spec['line_number'] == failed_test_line_number &&
          spec['file_path'] == failed_test_path
      end

      expect(newly_successful_spec['status']).to eq('passed')
    end
  end
end
