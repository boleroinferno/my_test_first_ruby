def translate(str)
   	vowels = ["a", "e", "i", "o", "u"]
   	
   	str.split(" ").map! do |word|
	    fvowel = word.index((word.split('') & vowels).first)	#find index of first vowel (via intersection)
	    fvowel += 1 if word[fvowel-1..fvowel] == "qu"           #in case fvowel is for 'u' of 'qu'
	    
	    "#{word[fvowel..-1]}#{word[0...fvowel]}ay"
	end.join(" ")
end