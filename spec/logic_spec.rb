require_relative '../lib/logic'
# rubocop: disable Style/MixinUsage
include Linter
# rubocop: enable Style/MixinUsage

describe Linter do
  let(:new_file) {Check.new('../bin/test')}
  describe '#initialize' do
    it 'takes an argument and initializes new class object' do
      expect(new_file.file).to eq ('../bin/test')
    end

    it 'takes an argument and initializes new class object' do
      temp = IO.readlines('../bin/test')
      expect(new_file.lines).to eq(temp)
    end

  end
end
