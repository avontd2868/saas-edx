#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  # First convert string to lowercase and remove all non-word characters
  clean_str = str.downcase.gsub(/\d|\W/,"")

  # Then compare it with the revese of itself
  clean_str == clean_str.reverse
end

def count_words(str)
  # YOUR CODE HERE
  words = str.split(/[^a-zA-Z]/)

  counter = Hash.new(0)
  words.each { |word| counter[word.downcase.gsub(/\d|\W/,"")] += 1 }

  counter
end


#the code below this line will test your functions.  You should remove everything below this line prior to submitting your file


test_str = "there goes the neighborhood"

if palindrome? test_str
  puts test_str + " => is a palindrome!"
else
  puts test_str + " => is NOT a palindrome!"
end


test_str = "Madam, I'm Adam"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end



test_str = "A man, a plan, a canal -- Panama"  # => true

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

test_str = "Abracadabra"                      # => false (nil is also ok)
if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "The rent is due on the first day of the month unless the first day of the month falls on a Saturday or Sunday"

word_count = count_words test_str
puts word_count


puts count_words("A man, a plan, a canal -- Panama")
    # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
puts count_words "Doo bee doo bee doo"
    # => {'doo' => 3, 'bee' => 2}