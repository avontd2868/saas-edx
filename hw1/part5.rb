class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
	class_eval %Q{
      def #{attr_name}= new_value
        # If missing, initialze history array
        @#{attr_name}_history ||= [nil] 

		# Update attribute with new value
        @#{attr_name} = new_value 

        # Add existing attribute to history
        @#{attr_name}_history << #{attr_name} 
      end
    }

  end
end

class Foo
    attr_accessor_with_history :bar
end

# f = Foo.new
# f.bar = 1
# f.bar = 2
# print "f.bar_history: #{f.bar_history}" # => if your code works, should be [nil, 1, 2]

# f = Foo.new     # => #<Foo:0x127e678>
# f.bar = 3       # => 3
# f.bar = :wowzo  # => :wowzo
# f.bar = 'boo!'  # => 'boo!'
# print f.bar_history   # => [nil, 3, :wowzo, 'boo!']

