class EmojiFormatter < RSpec::Core::Formatters::ProgressFormatter
  # This registers the notifications this formatter supports, and tells
  # us that this was written against the RSpec 3.x formatter API.
  RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed, :start_dump

  def example_passed(_notification)
    output.print "💚 "
  end

  def example_pending(_notification)
    output.print "🙇 "
  end

  def example_failed(_notification)
    output.print "💔 "
  end
end
