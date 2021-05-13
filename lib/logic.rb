module Linter

  attr_reader :file, :lines,
class Check

  def initialize (path)
    @file = path
    @lines = IO.readlines(file)
    @trailing_spaces = []
    @unclosed_tags = []
    @missing_tags = []
    @invalid_tags = []
    @empty_divs = []
    @no_alt_text = []
  end
end

end
