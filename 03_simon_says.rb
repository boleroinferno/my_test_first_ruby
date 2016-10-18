def echo(str)
    return str
end

def shout(str)
    return str.upcase
end

def repeat(str, num=2)
    repeater = "#{str}"
    (num-1).times { repeater << " #{str}" }
    return repeater
end

def start_of_word(str, num=0)
   return str[0..(num-1)] 
end

def first_word(str)
    return str.split[0] 
end

def titleize(str)
    little_words = ['over', 'and', 'the', 'is', 'it']
    
    str.split.map.with_index do |word, idx|
        if little_words.include?(word) && idx != 0
            word
        else
            word[0].upcase + word[1..-1]
        end
    end.join(" ")
end