class CartesianProduct
  include Enumerable
  # YOUR CODE HERE
  def initialize(a, b)
    @a = a
    @b = b
  end

  attr_accessor :a
  attr_accessor :b

  def each
  	ret = []
  	# puts "a #{a} b #{b}"
  	a.each {|x| b.each{|y| yield [x,y]}}
  	# print ret
  	return ret
  end
end

puts "1"
c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]
puts "2"
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty