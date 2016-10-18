def measure(n = 1)
    times = []
    
    n.times do
        start = Time.now
        yield
        times << (Time.now - start)
    end
    
   average = times.inject(:+) / times.size
   return average
end