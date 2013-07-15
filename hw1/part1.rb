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

