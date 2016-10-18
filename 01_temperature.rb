def ftoc(fahrenheit_temp)
    (fahrenheit_temp.to_f - 32) * 5/9
end

def ctof(celsius_temp)
    (celsius_temp.to_f * 9/5) + 32
end