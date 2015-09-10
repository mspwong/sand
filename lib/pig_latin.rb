class PigLatin
  def self.english_2_pig(english_phrase)
    self.new(english_phrase).english_2_pig
  end
  
  def initialize(english_phrase)
    @english_phrase = english_phrase
    @first_char = nil
    @punctuation = nil
    @english_chars_ary = nil
    @pig_word = nil
  end
  
  def english_2_pig
    @english_phrase.split.each_with_object('') do |english_word, pig_phrase|
      translate(english_word)
      pig_phrase << @pig_word << ' '
    end.strip
  end

  private

  def translate(english_word)
    @english_chars_ary = word_2_array(english_word)
    @first_char = @english_chars_ary.first
    trim_last_punctuation
    shift_left
    append_ay
    @pig_word = neutralize_capitalization
    restore_capitalization
    restore_punctuation
  end

  def word_2_array(english_word)
    english_word.split('')
  end

  def trim_last_punctuation
    last_char = @english_chars_ary.last
    unless alpha?(last_char)
      @punctuation = last_char
      @english_chars_ary = @english_chars_ary[0, @english_chars_ary.length - 1]
    end
  end

  def shift_left
    @english_chars_ary = @english_chars_ary.rotate unless vowel?(@first_char)
  end

  def append_ay
    @english_chars_ary << 'ay'
  end

  def neutralize_capitalization
    @english_chars_ary.join.downcase
  end

  def restore_capitalization
    @pig_word = @pig_word.capitalize if capitalized?(@first_char)
  end

  def restore_punctuation
    @pig_word << @punctuation if @punctuation
  end

  def capitalized?(char)
    char.upcase == char
  end

  def alpha?(char)
    char.match(/^[[:alpha:]]+$/) ? true : false
  end

  def vowel?(char)
    char.match(/a|e|i|o|u/) ? true : false
  end
end