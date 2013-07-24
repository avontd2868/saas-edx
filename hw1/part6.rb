class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)

    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end
  end
end

puts "5.dollars #{5.dollars}"
puts "5.dollars.in(:euros) #{5.dollars.in(:euros)}"
puts "10.euros #{10.euros}"
puts "10.euros.in(:rupees) #{10.euros.in(:rupees)}"

class String
  def palindrome?
    # First convert string to lowercase and remove all non-word characters
    clean_str = self.downcase.gsub(/\d|\W/,"")

    # Then compare it with the revese of itself
    clean_str == clean_str.reverse
  end
end

puts "ooo".palindrome?

module Enumerable
  def palindrome?
  # First convert string to lowercase and remove all non-word characters
  # clean_str = self.downcase.gsub(/\d|\W/,"")




  # Then compare it with the revese of itself
  if self.is_a?(::Hash)
    print "is hash"
    return false
  elsif self.respond_to?(:reverse)
    print "reverse"
    return self == self.reverse 
  else 
    return self.to_a == self.to_a.reverse 
  end
  # puts "self.is_a?(Array) #{self.is_a?(Array)}"
#   if !self.is_a?(::Hash)
#     puts "array"
#     self.each_with_index {|x, index| 
#       puts "each"
#       idx = index +1;
#       puts "self.count: #{self.count} idx: #{idx}"
#       puts "x: #{x} self[self.count - idx]: #{self[self.count - idx]}"
#       puts x==self[self.count - idx]
#       if !(x==self[self.count - idx])
#         return false
#       end
#     }
#   else
#     puts "else"
#     return false
#   end

# puts "about to return"
#   return true
end

end
puts [1,2,2,1].palindrome?

hash = {:a=>1, :b=>2}
puts hash.palindrome?

class Foo
  include Enumerable
  def initialize
    @palindrome = ["a","m","a"]
  end
  def each
    @palindrome.each {|e| yield e}
  end
end

puts "Foo #{Foo.new.palindrome?}"