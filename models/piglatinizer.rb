
class PigLatinizer

def initialize
  
end

  def starts_with_a_vowel?(word)
   if word.scan(/^[aeiou]|^[AEIOU]/) == []
     return false
   else
     return true
   end
  end


  def piglatinize(word)
    if word.split(" ").length >1
      words = word.split(" ")
      return words.collect {|w| piglatinize(w)}.join(" ")
    elsif starts_with_a_vowel?(word)
      return word + "way"
    elsif word.scan(/^[^aeiou][^aieou][^aeiou]/) != [] #CCC
      array = word.split(//)
      letters = array.shift(3).join + "ay"
      array << letters
      word = array.join
    elsif word.scan(/^[^aeiou][^aieou]/) != [] #CC
      array = word.split(//)
      letters = array.shift(2).join + "ay"
      array << letters
      word = array.join
    elsif word.scan(/^[^aeiou]/) != [] #C
      array = word.split(//)
      letters = array.shift(1).join + "ay"
      array << letters
      word = array.join
    end
    return word
  end
end
