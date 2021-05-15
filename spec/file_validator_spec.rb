require_relative '../lib/file_validator.rb'
# rubocop: disable Style/MixinUsage
include Linter
# rubocop: enable Style/MixinUsage

describe FileCheck do

let(:new_file) {FileCheck.new('../test_files/test')}
let(:empty_file) {FileCheck.new('../test_files/empty')}
let(:no_file) {FileCheck.new('../test_files/no_file')}

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
      expect(no_file.error_msg).to eql('Object can not be found. Enter a name of a valid file')
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
      expect(empty_file.empty_msg).to eql('There is no content in given file. Nothing to lint!')
    end
  end

  describe '#to_exit?' do
    it 'if file non existing, outputs message and exits' do
      expect(no_file.to_exit?).to output('Object can not be found. Enter a name of a valid file').to_stderr
    end

    it 'if file empty, outputs message and exits' do
      expect(empty_file.to_exit?).to output('Object can not be found. Enter a name of a valid file').to_stderr
    end

  end

end

