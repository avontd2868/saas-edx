def combine_anagrams(words)
  # YOUR CODE HERE
  sorted_words = []
  words.each { |word| sorted_words.push word.upcase.chars.sort.join }
  
  anagram_hash = {}
  sorted_words.each_with_index { |sorted_word, index|
  	# we set a hash key to an empty array, but only if it is currently nil.
    anagram_hash [sorted_word] ||= []
    # we add the word to the array
    anagram_hash[sorted_word] << words[index]
  }

  anagram_groups = []

  anagram_hash.each { |key, group| anagram_groups.push group }
  
  return anagram_groups

end


test_words = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'] 

print combine_anagrams test_words