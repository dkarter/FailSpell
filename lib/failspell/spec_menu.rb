module FailSpell
  class SpecMenu
    def self.show(failed_specs)
      proc do
        failed_specs.each_with_index do |spec, i|
          say "(#{i + 1}) #{spec['full_description']}"
          say "    #{spec['file_path']}:#{spec['line_number']}".red
        end

        range = "1-#{failed_specs.count}"
        prompt = "Which one would you like to re-run? (#{range}) "
        rerun = ask(prompt, Integer) { |q| q.in = 1..failed_specs.count }
        selected_spec = failed_specs[rerun - 1]
        spec_path =
          "#{selected_spec['file_path']}:#{selected_spec['line_number']}"
        yield(spec_path) if block_given?
        spec_path
      end
    end
  end
end
