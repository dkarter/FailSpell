require 'spec_helper'

describe FailSpell::SpecRunner do
  context '#run_spec' do
    it 'runs spec on system' do
      runner = described_class.new('some_path:123')
      expect(runner).to receive(:system).with('rspec some_path:123') { 'success' }
      expect(runner.run).to eq('success')
    end
  end

end
