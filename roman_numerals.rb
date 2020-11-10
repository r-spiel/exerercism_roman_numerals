=begin
Write your code for the 'Roman Numerals' exercise in this file. Make the tests in
`roman_numerals_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/roman-numerals` directory.
=end


class Integer
  #how do you count the time and space complexity?  With the # of digits = n?

  #CREDIT TO ANYA FOR THIS:
  CONVERSION = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I'
  }

  def to_roman_helper(roman, num)
    return roman if num.zero? || num.nil? #base case

    CONVERSION.each do |key, value|
      if (num / key) > 0
        roman += value
        num -= key #substract the key
        return to_roman_helper(roman, num)  #but this will recursively for each subtraction
      end
    end
  end

  def to_roman
    #subtract the max key from the hash (without going < 0), assign that corresponding roman value
    return to_roman_helper(roman = "", num = self)
  end


  # def to_roman
  #   if self / 1000 > 0
  #     return "M" * (self / 1000) + (self %1000).to_roman
  #   elsif self / 100 == 9
  #     return "CM" + (self % 100).to_roman
  #   elsif self / 100 > 4
  #     return "D" + "C" * ((self / 100) - 5) + (self % 100).to_roman
  #   elsif self / 100 == 4
  #     return "CD" + (self % 100).to_roman
  #   elsif self / 100 > 0 #then it is > 3 digits
  #     return "C" * (self / 100) + (self % 100).to_roman
  #   elsif self / 100 == 0 #self is 2 digist
  #     if self / 10 == 9
  #       return "XC" + (self % 10).to_roman
  #     elsif self / 10 > 4
  #       return "L" + "X" * ((self / 10) - 5) + (self % 10).to_roman
  #     elsif self / 10 == 4
  #       return "XL" + (self % 10).to_roman
  #     elsif self / 10 > 0
  #       return "X" * (self / 10) + (self % 10).to_roman
  #     elsif self / 10 == 0 #base case
  #       if self % 10 < 4
  #         return "I" * self
  #       elsif self % 10 == 4
  #         return "IV"
  #       elsif self % 10 >= 5 && self < 9
  #         return "V" + "I" * (self - 5)
  #       elsif self % 10 == 9
  #         return "IX"
  #       end
  #     end
  #   end
  # end
end

