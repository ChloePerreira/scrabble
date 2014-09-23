class Scrabble
  @@points_hash = {"a"=>1, "e"=>1, "i"=>1, "o"=>1, "u"=>1, "l"=>1, "n"=>1, "r"=>1, "s"=>1, "t"=>1, "d"=>2, "g"=>2, "b"=>3, "c"=>3, "m"=>3, "p"=>3, "f"=>4, "h"=>4, "v"=>4, "w"=>4, "y"=>4, "k"=>5,"j"=>8, "x"=>8,"q"=>10, "z"=>10}

  def self.letter_checker(letter)
    @@points_hash[letter.downcase]
  end

  def self.arrayer(word)
    array = word.downcase.split(//)
  end
  
  # this is my score method
  def self.word_totaler(word) 
    sum = 0
    arrayer(word).each do |letter|
      sum += letter_checker(letter)
    end
    sum
  end
  
  def self.word_size(word)
    arrayer(word).size
  end

  def self.check_tie(word1, word2)
    word_totaler(word1)==word_totaler(word2)
  end

  def self.tie_breaker(word1, word2)
    if word_size(word1) == word_size(word2)
      word1
    elsif word_size(word1) == 7
      word1
    elsif word_size(word2) == 7
      word2
    elsif word_size(word1) < word_size(word2)
      word1
    elsif word_size(word2) < word_size(word1)
      word2
    end
  end
  
  def self.highest_score_from(word_array)
    i = 0
    win = word_array[i]
    while i < word_array.size-1
      if word_totaler(win)<word_totaler(word_array[i+1])
        win = word_array[i+1]
      elsif check_tie(win, word_array[i+1])
        win = tie_breaker(win, word_array[i+1])
      end
      i+=1
    end
    win
  end
end

class Player
  attr_accessor :name
  def initialize(name)
    @name = name
    @score = 0
  end

  def total_score(array)
    total = 0
    array.each do |word|
      total += Scrabble.word_totaler(word)
    end
    @score = total
  end

  def won?
    if @score > 100
      true
    else
      false
    end
  end
    
end
