class RPNCalculator

    def initialize
        @stack = [] 
    end
    
    def push(num)
        @stack << num
    end
    
    ####################################################
    def plus
        raise ArgumentError.new("calculator is empty") if @stack.size < 2
        @stack << (@stack.pop + @stack.pop)
    end
    
    def minus
        raise ArgumentError.new("calculator is empty") if @stack.size < 2
        @stack << (-@stack.pop + @stack.pop)
    end
    
    def divide
        raise ArgumentError.new("calculator is empty") if @stack.size < 2
        divisor = @stack.pop
        @stack << (@stack.pop.to_f / divisor.to_f)
    end
        
    def times
        raise ArgumentError.new("calculator is empty") if @stack.size < 2
        @stack << (@stack.pop * @stack.pop)
    end
    ####################################################
    
    def evaluate(str)
		tokens(str).each do |el|
    	    if el == :+
    			self.plus
    		elsif el == :-
    			self.minus
    		elsif el == :/
    			self.divide
    		elsif el == :*
    		    self.times
    		else
    		    self.push(el)
    	    end
        end
        self.value
    end

    
    def value
        @stack[-1]
    end
    
    def tokens(str)
        str.split(" ").map { |char|
            (1..9).include?(char[0].to_i) ? char.to_i : char.to_sym }
    end
end
