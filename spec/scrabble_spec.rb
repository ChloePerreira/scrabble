require './scrabble'

describe Scrabble do
  describe ":letter_checker" do
    it "returns 1 when A, E, I, O, U, L, N, R, S, T" do
      expect(Scrabble.letter_checker("a")).to eq 1
    end
  
    context "when D or G" do
      it "returns 2" do
        expect(Scrabble.letter_checker("D")).to eq 2
      end
    end
    
    context "when B, C, M, P" do
      it "returns 3" do
        expect(Scrabble.letter_checker("b")).to eq 3
      end
    end
    
    context "when F, H, V, W, Y" do
      it "returns 4" do
        expect(Scrabble.letter_checker("F")).to eq 4
      end
    end
    
    context "when K" do
      it "returns 5" do
        expect(Scrabble.letter_checker("K")).to eq 5
      end
    end
    
    context "when J or X" do
      it "returns 8" do
        expect(Scrabble.letter_checker("J")).to eq 8
      end
    end
    
    context "when Q or Z" do 
      it "retruns 10" do 
        expect(Scrabble.letter_checker("Q")).to eq 10
      end
    end
  end
  
  describe ":word_totaler(word)" do
    it "returns the word score" do
      expect(Scrabble.word_totaler("CAT")).to eq 5
    end
  end

  describe ":word_size(word)"do
    it "returns word size" do
      expect(Scrabble.word_size("Blah")).to eq 4
    end
  end

  describe ":arrayer" do
    it "returns array from word" do
      expect(Scrabble.arrayer("blah")).to eq ["b","l","a","h"]
    end
  end

  describe ":check_tie"do
    it "returns true if tie" do
      expect(Scrabble.check_tie("blah", "blih")).to eq true
    end
  end

  describe ":tie_breaker(word1, word2)" do
    it "returns first word if score is the same and length is the same" do
      expect(Scrabble.tie_breaker("BILL", "PILL")).to eq "BILL"
    end
    it "returns smaller word if score is same, but length is different (and <7)" do
      expect(Scrabble.tie_breaker("BILLS", "KIT")).to eq "KIT"
    end 
    it "returns one that is 7 long if there's a tie" do
      expect(Scrabble.tie_breaker("CRYSTAL", "QUO")).to eq "CRYSTAL"
    end
  end

  describe ":highest_score_from(word_array)" do
    it "returns highest score from the array" do 
      expect(Scrabble.highest_score_from(["A", "AND", "LEAP", "ZILCH", "BLAH"])).to eq "ZILCH"
    end
  end 

  describe ":highest_score_from(word_array)" do
    it "returns highest score from the array" do
      expect(Scrabble.highest_score_from(["A", "AND", "LEAP", "blah", "zilch"])).to eq "zilch"
    end
  end

  describe ":highest_score_from(word_array)" do
    it "returns highest score from the array" do
      expect(Scrabble.highest_score_from(["zilch", "AND", "LEAP", "blah", "a"])).to eq "zilch"
    end
  end

  describe ":highest_score_from(word_array)" do
    it "returns highest score from the array" do
      expect(Scrabble.highest_score_from(["ZILCH", "AND", "zilch", "blah", "a"])).to eq "ZILCH" 
    end
  end
end

describe Player do
  describe "#name" do
    it "returns name" do
      expect(Player.new("Blah").name).to eq "Blah"
    end
  end

  describe "#total_score" do
    it "returns the total score from array" do
      expect(Player.new("name").total_score(["It", "A", "at"])).to eq 5
    end
  end
  
  describe "#won?" do
    it "returns true if score > 100" do
      expect(Player.new("name").won?).to eq false
    end
  end

  describe "#play(word)"do
    it "returns play array"do
      expect(Player.new("name").play("blah")).to eq ["blah"]
    end

    context "when player has won"do
      it "returns false" do
        test = Player.new("name")
        test.play("ZZZZ")
        expect(test.play("ZZZZZZZZ")).to eq false
      end
    end
  end
    
end

