# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
require "byebug"
def all_vowel_pairs(words)
    returning_answer = []
    #debugger
    (0..words.length-2).each do |idx1|
        (idx1+1...words.length).each do |idx2|
            vowels = 'aeiou'
            #for words 1 and 2
            string_of_letters = words[idx1]+ " " + words[idx2]
            string_of_letters.each_char do |char|
                if vowels.include?(char)
                    vowels = vowels.delete char
                end
            end
            if vowels.empty?
                returning_answer << string_of_letters
            end
        end
    end
    returning_answer
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |possible_factor|
        if num % possible_factor == 0
            return true
        end
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    returning_array = []
    (0..str.length-2).each do |idx|
        two_saved_chars = str[idx] + str[idx+1]
        if bigrams.include?(two_saved_chars)
            returning_array << two_saved_chars
        end
    end
    final_answer = []

    bigrams.each do |ele|
        if returning_array.include?(ele)
            final_answer << ele
        end
    end
    final_answer
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k, v| k==v }
        answer = {}
        self.each do |k, v|
            if prc.call(k, v)
                answer[k] = v
            end
        end
        answer
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        returning_array = []
        #iterate from zero to length of string
        #iterate from previous i to length of string using nested loop
        #if the self.substring.lenght == length then we shovel into the array
        if length == nil
            (0...self.length).each do |i|
                (i...self.length).each do |j|
                    returning_array << self[i..j]
                end
            end
            return returning_array
        end

        (0...self.length).each do |i|
            (i...self.length).each do |j|
                if self[i..j].length == length
                    returning_array << self[i..j]
                end
            end
        end
        returning_array
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        #debugger
        alphabet = ('a'..'z').to_a
        answer = ''
        self.each_char.with_index do |char, idx|
            position = alphabet.index(char)
            new_position = (position + num) % 26
            new_letter = alphabet[new_position]
            answer += new_letter
        end
        answer
    end
end
