include FileTest

module Linter

  class FileCheck

    attr_reader :checking

    def initialize(path=nil)
      @checking = path
    end

    def invalid?
      !exist?(@checking)
    end

    def error_msg
      'Object can not be found. Enter a name of a valid file'
    end

    def empty?
      IO.readlines(@checking) == []
    end

    def empty_msg
      'There is no content in given file. Nothing to lint!'
    end

    def to_exit?
      if invalid?
        puts error_msg
        exit
      elsif empty?
        puts empty_msg
        exit
      end
    end
  end
end
