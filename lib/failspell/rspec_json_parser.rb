module FailSpell
  class RspecJsonParser
    attr_reader :input_str

    def initialize(input_str)
      @input_str = input_str
    end

    def parse
      results = JSON.parse(input_str)
      results['examples'].select { |e| e['status'] == 'failed' }
    end
  end
end
