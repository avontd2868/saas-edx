def combine_anagrams(words)
 # YOUR CODE HERE
 sorted_words = []
 words.each {|word| sorted_words.push word.upcase.chars.sort.join}
 return sorted_words
end


test_words = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 

puts combine_anagrams test_words