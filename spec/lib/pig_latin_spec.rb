require 'spec_helper'
require_relative '../../lib/pig_latin'

describe PigLatin do
  describe '.english_2_pig' do
    specify { expect(described_class.english_2_pig('hello')).to eq 'ellohay' }

    specify { expect(described_class.english_2_pig('hello world')).to eq 'ellohay orldway' }

    specify { expect(described_class.english_2_pig('Hello World')).to eq 'Ellohay Orldway' }

    specify { expect(described_class.english_2_pig('Hello, world!')).to eq 'Ellohay, orldway!' }

    specify { expect(described_class.english_2_pig('eat apples')).to eq 'eatay applesay' }
  end
end