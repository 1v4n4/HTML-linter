require_relative '../lib/logic'
# rubocop: disable Style/MixinUsage
include Linter
# rubocop: enable Style/MixinUsage

describe Linter do
  let(:new_file) {Check.new('../test_files/test')}
  let(:correct_file) {Check.new('../test_files/test_correct')}
    
  describe '#initialize' do
    it 'takes an argument and initializes new class object' do
      expect(new_file.file).to eq ('../test_files/test')
    end

    it 'takes an argument and initializes new class object' do
      temp = IO.readlines('../test_files/test')
      expect(new_file.lines).to eq(temp)
    end

  end

  describe '#trailing_spaces' do
    it 'updates @traling with numbers of lines with the trailing spaces' do
      new_file.trailing_spaces
      expect(new_file.trailing.empty?).to be false
    end
    
    it 'updates @traling with numbers of lines with the trailing spaces' do
      correct_file.trailing_spaces
      expect(correct_file.trailing.empty?).to be true
    end
  end
  
  describe '#empty_line?' do
    it 'checks if last line is empty' do
      new_file.empty_line?  
      expect(new_file.last_line).to be false          
    end
    
    it 'returns true if last line is empty' do
      correct_file.empty_line?  
      expect(correct_file.last_line).to be false          
    end
  end
  
  describe '#indentation_two' do
    it 'updates identation variable with the number of line with wrong identation' do
      new_file.indentation_two
      expect(new_file.indentation[:by_two]).not_to be_empty
    end
    
    it 'updates identation variable with the number of line with wrong identation' do
      correct_file.indentation_two
      expect(correct_file.indentation[:by_two]).to be_empty
    end
  end
  
  describe '#indentation_first' do
    it 'updates identation variable if identation of the first line is different than zero' do
      new_file.indentation_first
      expect(new_file.indentation[:zero][0]).to eql('first')
    end
  end
  
  describe '#indentation_first' do
    it 'checks if identation of the first line is different than zero' do
      correct_file.indentation_first
      expect(correct_file.indentation[:zero]).to be_empty
    end
  end
  
  describe '#indentation_last' do
    it 'updates identation variable if identation of the last not empty line is different than zero' do
      new_file.indentation_last
      expect(new_file.indentation[:zero][1]).to eql('last')
    end
  end
  
  describe '#indentation_last' do
    it 'checks if identation of the last line is different than zero' do
      correct_file.indentation_last
      expect(correct_file.indentation[:zero]).to be_empty
    end
  end
    
  describe '#indentation_vertical' do
    it 'checks if the indentation of the line is same or different by two as previous/last' do
      new_file.indentation_vertical
      expect(new_file.indentation[:vertical]).not_to be_empty
    end
    
    it 'checks if the indentation of the line is same or different by two as previous/last' do
      correct_file.indentation_vertical
      expect(correct_file.indentation[:vertical]).to be_empty
    end
  end
  
  describe '#open_braces' do
    it 'if finds an open brace updates variable with a number of line' do
      new_file.open_braces
      expect(new_file.unclosed).not_to be_empty
    end
    
    it 'does nothing if there is no opened braces in a file' do
        correct_file.open_braces
      expect(correct_file.unclosed).to eql([])
    end 
  end
    
  describe '#empty_line?' do     
    it 'checks if the last line of html file is empty' do
      new_file.empty_line?
      expect(new_file.last_line).to be false                 
    end
  end
   
    
end
