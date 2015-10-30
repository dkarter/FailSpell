require 'spec_helper'

describe FailSpell::CLI do
  context '#run_suite' do
    it 'calls spec runner' do
      expect_any_instance_of(FailSpell::SpecRunner).to receive(:run_and_store_results)
      FailSpell::CLI.new.run_suite
    end
  end
end
