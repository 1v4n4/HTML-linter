require_relative '../lib/logic'
# rubocop: disable Style/MixinUsage
include Linter
# rubocop: enable Style/MixinUsage

describe Linter do
  let(:new_file) {Check.new('../test_files/test')}
  let(:correct_file) {Check.new('../test_files/test_correct')}
  let(:fl_file) {Check.new('../test_files/first_last_identation')}
  
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
  
  describe '#indentation_two' do
    it 'updates identation variable with the number of line with wrong identation' do
      new_file.indentation_two
      expect(new_file.indentation[:by_two]).not_to be_empty
    end
    
    it 'updates identation variable with the number of line with wrong identation' do
      new_file.indentation_two
      expect(correct_file.indentation[:by_two]).to be_empty
    end
  end
  
  describe '#indentation_first' do
    it 'updates identation variable if identation of the first line is different than zero' do
      fl_file.indentation_first
      expect(fl_file.indentation[:zero]).to eql(['first'])
    end
  end
  
  describe '#indentation_first' do
    it 'checks if identation of the first line is different than zero' do
      correct_file.indentation_first
      expect(correct_file.indentation[:zero]).to be_empty
    end
  end
  
  describe '#indentation_last' do
    it 'updates identation variable if identation of the first line is different than zero' do
      fl_file.indentation_last
      expect(fl_file.indentation[:zero]).to eql(['last'])
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
      new_file.indentation_vertical
      expect(correct_file.indentation[:vertical]).to be_empty
    end
  end
  
  
end
