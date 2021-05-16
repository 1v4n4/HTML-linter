require 'colorize'

include FileTest

module Linter

  class FileCheck

    attr_reader  :return

    def initialize(path=nil)
      @checking = path
      @return = false
    end
      
    def no_arg? 
      @checking.nil?
    end
    
    def no_arg_msg
      "\n\n No argument detected! Please, add a name of the file \n\n".red
    end
    
    def invalid?
      !exist?(@checking)
    end

    def error_msg
      "\n\n Object can not be found. Enter a name of a valid file \n\n".red
    end

    def empty?
      IO.readlines(@checking) == []
    end

    def empty_msg
      "\n\n There is no content in given file. Nothing to lint! \n\n".red
    end
    
    def to_exit?
      if no_arg?
        @return = true
        no_arg_msg
      elsif invalid?       
        @return = true
        error_msg
      elsif empty?         
        @return = true
        empty_msg
      end
    end
    
  end
end
