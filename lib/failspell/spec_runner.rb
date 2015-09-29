module FailSpell
  class SpecRunner
    attr_reader :spec_path

    def initialize(spec_path)
      @spec_path = spec_path
    end

    def run
      system "rspec #{spec_path}"
    end
  end
end