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
  
  describe '#indentation_vertical' do
    it 'checks if the indentation of the line is same or different by two as previous/last' do
      new_file.indentation_vertical
      expect(new_file.indentation[:vertical]).not_to be_empty
    end
  end
end
