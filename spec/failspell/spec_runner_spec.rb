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
    let(:runner) { described_class.new('./some_path.rb:123') }
    let(:tmp_run_file) { './tmp/tmp_run' }

    before do
      command = "rspec ./some_path.rb:123 -f p -f j -o #{tmp_run_file}"
      allow(runner).to receive(:system).with(command)
    end

    it 'runs the single spec and returns true when spec passed' do
      failure_result = '{ "summary": { "failure_count": 0 }}'
      write_result_file(failure_result)
      expect(runner.run_single_and_return_result).to be_truthy
    end

    it 'runs the single spec and returns false when spec failed' do
      success_result = '{ "summary": { "failure_count": 1 }}'
      write_result_file(success_result)
      expect(runner.run_single_and_return_result).to be_falsey
    end

    it 'does not leave temporary file behind' do
      success_result = '{ "summary": { "failure_count": 1 }}'
      write_result_file(success_result)
      runner.run_single_and_return_result
      expect(File.exist?(tmp_run_file)).to eq(false)
    end

    def write_result_file(result_json)
      FileUtils.mkdir_p './tmp'
      File.open(tmp_run_file, 'w') { |f| f.write(result_json) }
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
