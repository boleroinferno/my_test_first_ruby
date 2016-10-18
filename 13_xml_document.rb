class XmlDocument
    attr_accessor :indent_level
    
    def initialize(indent = false)
        @indent = indent
        @indent_level = 1
    end
    
    def method_missing(method_name, *args, &block)
        @indent ? space = ("  " * @indent_level) : space = ""
        
        if block_given?
            @indent_level += 1
        else
            @indent_level -= 1
        end
        
        if block_given?
            @indent ? line = "\n" : line = ""
            return "<#{method_name}>#{line}#{space}#{yield(true)}#{space.chomp("  ")}</#{method_name}>#{line}"
            
        elsif args[0].is_a? Hash
            @indent ? line = "\n" : line = ""
            args[0].each do |key, val|
                return "<#{method_name} #{key}=\"#{val}\"/>#{line}"
            end
        else
            return "<#{method_name}/>"
        end
    end
    
end