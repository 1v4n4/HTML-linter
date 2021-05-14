module Linter

  attr_reader :file, :lines, :trailing, :indentation
  class Check

    def initialize (path)
      @file = path
      @lines = IO.readlines(file)
      @trailing = []
      @indentation = {:by_two => [], :zero => [], :other => []}
      @unclosed = []
      @missing_tags = []
      @empty_divs = []
      @no_alt_text = []
    end

    def trailing_spaces
      0.upto(@lines.size-1) do |i|
        arr = @lines[i].split("")
          if arr[-2] == " "
            @trailing.push(i+1)
          end
      end
    end
    
    def indentation_two
      arr = @lines.map {|x| x[/^\s*/].size }
      
      1.upto(arr.size-2) do |i|
        if (arr[i]%2).odd? || arr[i] == 0
          @indentation[:by_two].push(i+1)          
        end
      end
    end
    
    def indentation_first
      arr = @lines.map {|x| x[/^\s*/].size }
      indentation[:zero].push('first') if arr.first != 0
    end
    
    def indentation_last
      arr = @lines.map {|x| x[/^\s*/].size }
      indentation[:zero].push('last') if lines.last != 0
    end
    
    def indentation_vertical #checks only if the indentation of the line is same or different by two as previous/last
      arr = @lines.map {|x| x[/^\s*/].size }
      a = []
      1.upto(arr.size-2) do |i|      
        a.push(arr[i]-arr[i+1])       
      end
      p a
      a.each_with_index {|x,indx| @indentation[:other].push(indx+2) if ![0,2,-2].include?(x) }
    end
  

  end
end
