class Book
    attr_reader :title
    
    @@conjunctions  = ['for', 'and', 'nor', 'but', 'or', 'yet', 'so']
	@@prepositions  = ['with', 'at', 'into', 'or', 'in', 'of']
	@@underliners   = ['the', 'a', 'an']
    
    def title=(tit)
        @title = tit.split.map.with_index do |word, idx|
            if (@@conjunctions + @@prepositions + @@underliners).include?(word) && idx != 0
                word
            else
                word.capitalize
            end
        end.join(" ")
    end
    
end