
module Linter

  
  class Check
    attr_reader :file, :lines, :trailing, :indentation, :unclosed, :last_line, :no_alt_text
    def initialize (path)
      @file = path
      @lines = IO.readlines(file)
      @trailing = []
      @indentation = {:by_two => [], :zero => [], :vertical => []}
      @unclosed = []
      @last_line = false
      @no_alt_text = {:missing_alt => [], :empty_alt => []}
      run_checks
    end

    def trailing_spaces
      0.upto(@lines.size-1) do |i|
        arr = @lines[i].split("")
          if arr[-2] == " "
            @trailing.push(i+1)
          end
      end
    end
    
    def empty_line?      
      last_line = true if lines.last == "\n"           
    end
    
    def indentation_two
      arr = @lines.map {|x| x== "\n" ? x = nil : x[/^\s*/].size }  
      1.upto(arr.size-3) do |i| 
        next if arr[i] == nil    
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
      indentation[:zero].push('last') if arr[-2] != 0 && !last_line
    end
    
    def indentation_vertical  
      arr = @lines.map {|x| x== "\n" ? x = nil : x[/^\s*/].size }      
      a = []
      1.upto(arr.size-2) do |i|
        if arr[i].nil?
          a.push('x')
        elsif !arr[i].nil? && !arr[i+1].nil?
          a.push(arr[i]-arr[i+1])
        elsif !arr[i].nil? && arr[i+1].nil?
            j=i+1
            loop do 
              j+=1 
              break if !arr[j].nil? or j >= arr.size-2 
            end                                    
            a.push(arr[i]-arr[j]) if !arr[i].nil? && !arr[j].nil?
            next 
        end
      end      
      a.each_with_index {|x,indx| @indentation[:vertical].push(indx+2) if ![0,2,-2,'x'].include?(x) }          
    end
    
    def open_braces
        arr = lines.map {|x| x== "\n" ? x = 0 : x.scan(/>*<*/).join} 
        a = arr.map {|x| x.size}
        a.each_with_index {|i, indx| unclosed.push(indx+1) if i.odd?} 
    end   
    
    def alt_check
      lines.each_with_index do |i, index|
        if /img/.match(i) && !/alt/.match(i)
          no_alt_text[:missing_alt].push(index+1)
        elsif /img/.match(i) && !/alt=['"][w+]['"]/.match(i)
          no_alt_text[:empty_alt].push(index+1)
        end      
      end           
    end
    
    def run_checks
      trailing_spaces
      indentation_two
      indentation_vertical
      indentation_first
      indentation_last
      open_braces
      empty_line?
      alt_check
    end    
  end
end
