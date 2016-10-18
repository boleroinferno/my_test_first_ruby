class Fixnum
    
    @@ones = {
        0 => "zero",
        1 => "one",
        2 => "two",
        3 => "three",
        4 => "four",
        5 => "five",
        6 => "six",
        7 => "seven",
        8 => "eight",
        9 => "nine" }
        
    @@tweens = {
        10 => "ten",
        11 => "eleven",
        12 => "twelve" }
        
    @@teens = {
        13 => "thirteen",
        14 => "fourteen",
        15 => "fifteen",
        16 => "sixteen",
        17 => "seventeen",
        18 => "eighteen",
        19 => "nineteen" }
        
    @@tens = {
        20 => "twenty",
        30 => "thirty",
        40 => "forty",
        50 => "fifty",
        60 => "sixty",
        70 => "seventy",
        80 => "eighty",
        90 => "ninety" }
        
    @@prefix_nums = {
        "000" => "thousand",
        "000000" => "million",
        "000000000" => "billion",
        "000000000000" => "trillion" }

    
    def in_words
        if self < 10
            return @@ones[self] 
        elsif self < 13
            return @@tweens[self]
        elsif self < 20
            return @@teens[self]
        end
        
        
        if self < 100
            dec_nums
        elsif self < 1000
            cent_nums
        elsif self >= 1000
            mill_nums
        end
    end
    
    
    private
    
    def dec_nums
        num = self.to_s.split('')
        ten, one = num[-2], num[-1]
        if one == "0"
            @@tens[self]
        else
            "#{(ten + "0").to_i.in_words} #{one.to_i.in_words}"
        end
    end
    
    def cent_nums
        num = self.to_s.split('')
        hundred, ten, one = num[-3], num[-2], num[-1]
        
        if self % 100 == 0
            "#{hundred.to_i.in_words} hundred"
        else
            "#{hundred.to_i.in_words} hundred #{(ten + one).to_i.in_words}"
        end
    end
    
    def mill_nums
        num = self.to_s.split('')
        leftover = []
        
        until num.length <= 3
	        leftover << num.pop
	        leftover << num.pop
	        leftover << num.pop
        end
        leftover.reverse!
        num = num.join.to_i
        
        if leftover.join.to_i == 0
            "#{num.in_words} #{@@prefix_nums["0" * leftover.length]}"
        else
            "#{num.in_words} #{@@prefix_nums["0" * leftover.length]} #{leftover.join.to_i.in_words}"
        end
        
    end
    
end