require_relative '../lib/file_validator.rb'
require 'colorize'
# rubocop: disable Style/MixinUsage
include Linter
# rubocop: enable Style/MixinUsage

describe FileCheck do

let(:new_file) {FileCheck.new('../test_files/test')}
let(:empty_file) {FileCheck.new('../test_files/empty')}
let(:no_file) {FileCheck.new('../test_files/no_file')}
let(:no_argument) {FileCheck.new(nil)}


  describe '#no_arg?' do
    it 'returns true if no argument given' do
      expect(no_argument.no_arg?).to be true
    end
    
    it 'returns false if  argument given' do
      expect(new_file.no_arg?).to be false
    end
  end
    
  describe '#no_arg_msg' do
    it 'returns a message that no argument is given' do
      expect(no_argument.no_arg_msg).to eql ("\n\n No argument detected! Please, add a name of the file \n\n".red)
    end
  end
    
  describe '#invalid?' do
    it 'checks if file exists' do
      expect(new_file.invalid?).not_to be true
    end

    it 'checks if file exists and returns true if not' do
      expect(no_file.invalid?).to be true
    end
  end

  describe '#error_msg' do
    it 'returns a message that file not exists' do
      expect(no_file.error_msg).to eql("\n\n Object can not be found. Enter a name of a valid file \n\n".red)
    end
  end

  describe '#empty?' do
    it 'checks if file is empty' do
      expect(new_file.empty?).not_to be true
    end

    it 'returns true if file is empty' do
      expect(empty_file.empty?).to be true
    end
  end

  describe '#empty_msg' do
    it 'returns a message that file is empty' do
      expect(empty_file.empty_msg).to eql("\n\n There is no content in given file. Nothing to lint! \n\n".red)
    end
  end

  describe '#to_exit?' do    
    it 'if no argument given, updates @return with true' do
      no_argument.to_exit?
      expect(no_argument.return).to be true
    end
    it 'if file non existing, updates @return with true' do
      no_file.to_exit?
      expect(no_file.return).to be true
    end

    it 'if file empty, updates @return with true' do
      empty_file.to_exit?
      expect(empty_file.return).to be true
    end

  end

end

