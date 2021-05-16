require 'colorize'
module Linter
  # rubocop: disable Metrics/MethodLength

  # getting rid of "Missing top-level class documentation comment" warninig
  class Check
    attr_reader :report, :file, :lines, :trailing, :last_line, :indentation, :unclosed

    def initialize(path)
      @file = path
      @lines = IO.readlines(@file)
      @trailing = []
      @last_line = false
      @indentation = { by_two: [], zero: [], vertical: [] }
      @unclosed = []
      @no_alt_text = []
      @report = []
      run_checks
    end

    # rubocop: disable Style/StringChars
    def trailing_spaces
      0.upto(@lines.size - 1) do |i|
        arr = @lines[i].split('')
        @trailing.push(i + 1) if arr[-2] == ' '
        # rubocop: enable Style/StringChars
      end
    end

    def empty_line?
      @last_line = true if @lines.last == "\n"
    end

    # rubocop: disable Metrics/AbcSize
    # rubocop: disable Style/NumericPredicate
    # rubocop: disable Lint/UselessAssignment

    def indentation_two
      arr = @lines.map { |x| x == "\n" ? x = nil : x[/^\s*/].size }
      1.upto(arr.size - 3) do |i|
        next if arr[i].nil?

        @indentation[:by_two].push(i + 1) if (arr[i] % 2).odd? || arr[i] == 0
      end
    end

    # rubocop: enable Style/NumericPredicate

    def indentation_first
      arr = @lines.map { |x| x[/^\s*/].size }
      @indentation[:zero].push(1) if arr.first != 0
    end

    def indentation_last
      arr = @lines.map { |x| x[/^\s*/].size }
      @indentation[:zero].push(2) if arr[-2] != 0 && @last_line
    end

    # rubocop: disable Metrics/CyclomaticComplexity
    # rubocop: disable  Metrics/PerceivedComplexity

    def indentation_vertical
      arr = @lines.map { |x| x == "\n" ? x = nil : x[/^\s*/].size }
      a = []
      1.upto(arr.size - 2) do |i|
        if arr[i].nil?
          a.push('x')
        elsif !arr[i].nil? && !arr[i + 1].nil?
          a.push(arr[i] - arr[i + 1])
        elsif !arr[i].nil? && arr[i + 1].nil?
          j = i + 1
          loop do
            j += 1
            break if !arr[j].nil? || (j >= arr.size - 2)
          end
          a.push(arr[i] - arr[j]) if !arr[i].nil? && !arr[j].nil?
          next
        end
      end
      a.each_with_index { |x, indx| @indentation[:vertical].push(indx + 2) unless [0, 2, -2, 'x'].include?(x) }
    end

    def open_braces
      arr = @lines.map { |x| x.empty? ? x = 0 : x.scan(/>*<*/).join }
      a = arr.map(&:size)
      a.each_with_index { |i, indx| @unclosed.push(indx + 1) if i.odd? }
    end

    def alt_check
      @lines.each_with_index do |i, index|
        @no_alt_text.push(index + 1) if /<img/.match(i) && !/alt/.match(i)
      end
    end

    private

    def run_checks
      trailing_spaces
      empty_line?
      indentation_two
      indentation_vertical
      indentation_first
      indentation_last
      open_braces
      alt_check
      output
      sort_report
    end

    # rubocop: enable Lint/UselessAssignment

    def output
      @trailing.each do |x|
        @report.push([x,
                      ["Line #{x}: ".yellow, 'Trailing spaces detected!'.red,
                       'No extra white spaces at the end of line.'.yellow]])
      end

      unless @last_line
        @report.push([@lines.size,
                      ["Line #{@lines.size}: ".yellow, 'Content detected!'.red,
                       ' The last line must be empty.'.yellow]])
      end

      @indentation[:by_two].each do |x|
        @report.push([x,
                      ["Line #{x}: ".yellow, 'The wrong indentation detect!'.red, ' You must indent by two.'.yellow]])
      end

      if @indentation[:zero].include?(1)
        @report.push([1,
                      ['Line 1: '.yellow, 'The wrong indentation detect!'.red,
                       ' This line must have zero indentation.'.yellow]])
      end

      if @indentation[:zero].include?(2)
        @report.push([@lines.size - 1,
                      ["Line #{@lines.size}: ".yellow, 'The wrong indentation detect!'.red,
                       ' This line must have zero indentation.'.yellow]])
      end

      @indentation[:vertical].each do |x|
        @report.push([x,
                      ["Line #{x}: ".yellow, 'The wrong vertical indentation detect!'.red,
                       ' Follow surrounding lines.'.yellow]])
      end

      @unclosed.each do |x|
        @report.push([x, ["Line #{x}: ".yellow, 'Missing brace detect!'.red, ' Tags must be closed.'.yellow]])
      end

      @no_alt_text.each do |x|
        @report.push([x, ["Line #{x}: ".yellow, 'Alt not detected!'.red, ' Add an alt attribute.'.yellow]])
      end
    end

    def sort_report
      @report.sort!.map! { |x| x[1].join }
    end

    # rubocop: enable Metrics/CyclomaticComplexity
    # rubocop: enable  Metrics/PerceivedComplexity
    # rubocop: enable Metrics/AbcSize

    public

    def total
      if @report == []
        "\n\n      NO OFFENSES FOUND!\n\n".green
      elsif @report.size == 1
        "\n\n\n      #{@report.size} OFFENSE FOUND!\n\n".red
      else
        "\n\n\n      #{@report.size} OFFENSES FOUND!\n\n".red
      end
    end
    # rubocop: enable Metrics/MethodLength
  end
end
