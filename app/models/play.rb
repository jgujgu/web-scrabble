class Play < ActiveRecord::Base
  validates :word, presence: true, length: { maximum: 7 }, format: { with: /\A[a-zA-Z]+\z/ }

  def letter_scores
    {"A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4, "G"=>2, "H"=>4, "I"=>1, "J"=>8,
     "K"=>5, "L"=>1, "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
     "U"=>1, "V"=>4, "W"=>4, "X"=>8, "Y"=>4, "Z"=>10}
  end

  def dc_word
    word.downcase
  end

  def score( options = {} )
    if options[:word_multiplier] == :double
      word.upcase.chars.inject(0){ |sum, letter| sum + letter_scores[letter] * 2 }
    elsif options[:word_multiplier] == :triple
      word.upcase.chars.inject(0){|sum, letter| sum + letter_scores[letter] * 3 }
    else
      word.upcase.chars.inject(0){|sum, letter| sum + letter_scores[letter]}
    end
  end
end
