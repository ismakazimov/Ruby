class Solution
  def int_to_roman(num)
    num_sym = [["I", 1], ["IV", 4], ["V", 5], ["IX", 9], ["X", 10],
               ["XL", 40], ["L", 50], ["XC", 90], ["C", 100], ["CD", 400],
               ["D", 500], ["CM", 900], ["M", 1000]]

    results = ""
    num_sym.reverse_each do |sym, val|
      if num / val > 0
        count = num / val
        results += sym * count
        num %= val
      end
    end
    results
  end
end

# Create an instance of Solution
solution = Solution.new

# Call the int_to_roman method with the desired input
result = solution.int_to_roman(1998)
puts result