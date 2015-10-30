module FailSpell
  class SpecRunner
    def initialize(spec_path)
      @spec_path = spec_path
    end

    def run
      system "rspec #{spec_path}"
    end

    def run_and_store_results
      # TODO: add optional .failspell file to project and read options from it
      # options for the rspec command that is
      system "rspec #{spec_path} -f p -f j -o ./tmp/failspell_last_run.json"
    end

    def run_single_and_return_result
      tmp_result_file = './tmp/tmp_run'
      system "rspec #{spec_path} -f p -f j -o #{tmp_result_file}"
      if (File.exists?(tmp_result_file))
        result_json = JSON.parse(File.read(tmp_result_file))
        result = result_json['summary']['failure_count'] == 0
        FileUtils.rm_f(tmp_result_file)
        result
      else
        false
      end
    end

    private

    attr_reader :spec_path
  end
end
