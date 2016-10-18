class Temperature
    
    def initialize(opts = {})
      @options = opts
    end
    
    
    def in_fahrenheit
        return @options[:f] if @options.has_key?(:f)
        ctof(@options[:c])
    end
    
    def in_celsius
        return @options[:c] if @options.has_key?(:c)
        ftoc(@options[:f])
    end


    def self.from_celsius c_temp
        Temperature.new(:c => c_temp)
    end
    
    def self.from_fahrenheit f_temp
        Temperature.new(:f => f_temp)
    end
    
    
    private
    
    def ftoc(fahrenheit_temp)
        (fahrenheit_temp.to_f - 32) * 5/9
    end
    
    def ctof(celsius_temp)
        (celsius_temp.to_f * 9/5) + 32
    end

end



class Celsius < Temperature
    def initialize(c_temp)
        @options = { :c => c_temp }
    end
end


class Fahrenheit < Temperature
    def initialize(f_temp)
        @options = { :f => f_temp }
    end
end