def add(num1, num2)
    num1 + num2
end

def subtract(num1, num2)
    num1 - num2
end

def sum(arr)
    arr.inject(0, :+)
end

def multiply(arr)
    arr.inject(1, :*) 
end

def power(num, num2)
    num ** num2
end

def factorial(num)
    1.upto(num-1) { |i| num *= i }
    num
end