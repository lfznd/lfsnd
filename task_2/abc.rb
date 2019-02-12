vowel = %w(a e i o u y)
vowel_hash = {}
abc = "a".."z"
abc.each.with_index(1) { |x, y| vowel_hash[x] = y if vowel.include?(x) }
puts vowel_hash
