class Dictionary
    attr_reader :entries
    
    def initialize
        @entries = {}
    end
    
    def keywords
        @entries.keys.sort
    end
    
    def include?(key)
        @entries.keys.include?(key)
    end
    
    def printable
        keywords.map! { |key| "[#{key}] \"#{@entries[key]}\"" }.join("\n")
    end
    
    def find(prefix)
        matches = {}
        @entries.select { |key, val| matches[key] = val if key[0...prefix.length] == prefix }
        return matches
    end
    
    def add(entry)
        if entry.is_a? String
            @entries[entry] = nil                       #add key => nil
        else
            entry.each {|k,v=nil| @entries[k] = v }     #add key => entry
        end
    end
    
end