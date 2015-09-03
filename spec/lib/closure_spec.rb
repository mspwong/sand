require "spec_helper"
require_relative "../../lib/closure"

describe Closure do
  before do
    @original_stdout = $stdout
    $stdout = StringIO.new
    @result = subject
  end

  after { $stdout = @original_stdout }

  describe '.play_block' do
    subject { described_class.play_block(4) }

    specify do
      expect($stdout.string).to match 'playing with blocks: 4'
      expect($stdout.string).to match 'playing with blocks: 8'
      expect($stdout.string).to match 'playing with blocks: 12'
      expect($stdout.string).to match 'playing with blocks: 20'

      expect(@result).to eq 44
    end
  end

  describe '.play_lambda' do
    subject { described_class.play_lambda(4) }

    specify do
      expect($stdout.string).to match 'playing with lambda: 4'
      expect($stdout.string).to match 'playing with lambda: 8'
      expect($stdout.string).to match 'playing with lambda: 12'
      expect($stdout.string).to match 'playing with lambda: 20'

      expect(@result).to eq 44
    end
  end

  describe '.play_proc' do
    subject { described_class.play_proc(4) }

    specify do
      expect($stdout.string).to match 'playing with proc: 4'
      expect($stdout.string).to match 'playing with proc: 8'
      expect($stdout.string).to match 'playing with proc: 12'
      expect($stdout.string).to match 'playing with proc: 20'

      expect(@result).to eq 44
    end
  end
end
