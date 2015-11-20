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

    private

    attr_reader :spec_path
  end
end
