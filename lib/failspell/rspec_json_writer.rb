module FailSpell
  class RspecJsonWriter
    def initialize(file_path:)
      @file_path = file_path
      @results = JSON.parse(File.read(file_path))
    end

    def update_spec_status(full_spec_path:, success:)
      spec_path_parts = full_spec_path.split(':')
      spec_index = results['examples'].find_index do |spec|
        spec['file_path'] == spec_path_parts[0] &&
        spec['line_number'] == spec_path_parts[1].to_i
      end

      status = success ? 'passed' : 'failed'
      results['examples'][spec_index]['status'] = status
    end

    def save
      File.open(file_path, 'w') do |file|
        file.write(results.to_json)
      end
    end

    private

    attr_reader :file_path, :results
  end
end
