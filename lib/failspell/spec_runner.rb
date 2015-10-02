module FailSpell
  class SpecRunner
    attr_reader :spec_path

    def initialize(spec_path)
      @spec_path = spec_path
    end

    def run
      system "rspec #{spec_path}"
    end

    def run_and_store_results
      system "rspec #{spec_path} -f p -f j -o ./tmp/failspec_last_run.json"
    end
  end
end
