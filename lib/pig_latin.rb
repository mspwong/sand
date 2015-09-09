class PigLatin
  def self.english_2_pig(english_phrase)
    words = english_phrase.split
    words.each_with_object('') do |word, pig_phrase|
      pig_phrase << translate_word(word) << ' '
    end.strip
  end

  private

  def self.translate_word(english_word)
    chars = word_2_array(english_word)
    first_char = chars.first
    chars, punctuation = trim_last_punctuation(chars)
    chars = shift_left(chars, first_char)
    append_ay(chars)
    pig_word = neutralize_capitalization(chars)
    pig_word = restore_capitalization(first_char, pig_word)
    restore_punctuation(pig_word, punctuation)
    pig_word
  end

  def self.word_2_array(english_word)
    english_word.split('')
  end

  def self.trim_last_punctuation(chars)
    last_char = chars.last
    unless alpha?(last_char)
      punctuation = last_char
      chars = chars[0, chars.length - 1]
    end
    return chars, punctuation
  end

  def self.shift_left(chars, first_char)
    vowel?(first_char) ? chars : chars.rotate
  end

  def self.append_ay(chars)
    chars << 'ay'
  end

  def self.neutralize_capitalization(chars)
    chars.join.downcase
  end

  def self.restore_capitalization(first_char, pig_word)
    capitalized?(first_char) ? pig_word.capitalize : pig_word
  end

  def self.restore_punctuation(pig_word, punctuation)
    pig_word << punctuation if punctuation
  end

  def self.capitalized?(char)
    char.upcase == char
  end

  def self.alpha?(char)
    char.match(/^[[:alpha:]]+$/) ? true : false
  end

  def self.vowel?(char)
    char.match(/a|e|i|o|u/) ? true : false
  end
end