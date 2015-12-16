require 'spec_helper'

describe FailSpell::SpecRunner do
  context '#run' do
    it 'runs spec on system' do
      runner = described_class.new('some_path:123')
      command = 'rspec some_path:123'
      expect(runner).to receive(:system).with(command) { 'success' }
      expect(runner.run).to eq('success')
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
