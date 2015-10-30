require 'spec_helper'

describe FailSpell::SpecRunner do
  context '#run_spec' do
    it 'runs spec on system' do
      runner = described_class.new('some_path:123')
      expect(runner).to receive(:system).with('rspec some_path:123') { 'success' }
      expect(runner.run).to eq('success')
    end
  end

  context '#run_single_and_store_result' do
    let(runner) { described_class.new('./some_path.rb:123') }

    it 'runs the single spec and returns true when spec passed' do
      json_result = '{ "summary": { "failure_count": 0 }}'
      expect(runner).to receive(:system).with('rspec ./some_path.rb:123 -f p -f j -o ./tmp/tmp_run')
      expect(File).to receive(:read).with('./tmp/tmp_run') { json_result }
      expect(runner.run_single_and_return_result).to be_truthy
    end

    it 'runs the single spec and returns false when spec failed' do
      json_result = '{ "summary": { "failure_count": 1 }}'
      expect(runner).to receive(:system).with('rspec ./some_path.rb:123 -f p -f j -o ./tmp/tmp_run')
      expect(File).to receive(:read).with('./tmp/tmp_run') { json_result }
      expect(runner.run_single_and_return_result).to be_falsey
    end

    it 'does not leave temporary file behind' do

    end
  end

  context '#run_and_store_results' do
    it 'runs spec file or directory with json formatter' do
      runner = described_class.new('spec/')
      command = 'rspec spec/ -f p -f j -o ./tmp/failspell_last_run.json'
      expect(runner).to receive(:system).with(command) { 'success' }
      expect(runner.run_and_store_results).to eq('success')
    end
  end

end
