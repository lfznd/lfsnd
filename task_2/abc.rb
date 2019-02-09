vowel = ["a","e","i","o","u","y"]
vowel_hash = {}
abc = "a".."z"
abc.each_with_index {|x, y| vowel_hash[x] = y + 1 if vowel.include?(x)}
puts ("#{vowel_hash}")
