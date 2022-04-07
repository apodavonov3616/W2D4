def no_dupes?(arr)
    #iterate and add to hash
    #for each hash, select the value==1
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele]+=1
    end
    answer = []
    hash.each do |k, v|
        if v==1
            answer << k
        end
    end
    answer
end 
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(array)
    #count fromo 0 to array-1noninclsive
    #call arra at that index
    #if its same as next, return false
    #true
    (0...array.length-1).each do |idx|
        return false if array[idx] == array[idx+1]
    end
    true
end
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true
require "byebug" 

def char_indices(str)
    #hash.new ,,,, iterate through stirng with indiex
    
    #debugger
    hash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index do |char, idx|
        hash[char] << idx
    end
    hash
end
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(string)
    #iterate through the string normally
    #current = char
    #while char == current
    #keep looping
    #when the char != current, stop looping, take the counter as v, and the repeats as k
    #sort the hash
    #tkae the one that's last key
    comparison = ''
    answer = ''
    (0...string.length).each do |idx|
        if string[idx] == string[idx+1]
            comparison += string[idx]
        else
            comparison += string[idx]
            answer = comparison if comparison.length >= answer.length
            comparison = ''
        end
    end
    answer
end
# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def is_prime?(n)
    (2...n).each do |ele|
        if n%ele == 0
            return false
        end
    end
    n>=2
end

def bi_prime?(num)
    (2...num).each do |i|
        (i...num).each do |j|
            if i * j == num && is_prime?(i) && is_prime?(j)
                return true
            end
        end
    end
    false
end
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alphabet = ('a'..'z').to_a
    key_position = 0
    new_message = []
    message.split("").each_with_index do |ele, idx|
        old_position = alphabet.index(ele)
        new_position = ( old_position + keys[key_position] ) % 26
        new_message << alphabet[new_position]
        key_position = (key_position+1) % keys.length
    end
    new_message.join('')
end
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(string)
    vowels = 'aeiou'
    string_vowels = ''

    string.each_char {|ele| string_vowels << ele if vowels.include?(ele) }

    string_vowels = string_vowels.split("")
    string_vowels.unshift(string_vowels[-1])
    string_vowels = string_vowels.join('')

    #now you have the tools you need
    #debugger
    (0...string.length).each do |idx|
        if vowels.include?(string[idx])
            string[idx] = string_vowels[0]
            string_vowels[0] = ""
        end
    end
    string

    
end
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String
    def select(&prc)
        return '' if prc == nil
        answer = ''
        self.each_char do |char|
            if prc.call(char) == true
                answer += char
            end
        end
        answer
    end
end
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

class String
    def map!(&prc)
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx)
        end
    end
end
# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(a, b)
    if b<0
        b = -b 
        a = -a
    end
    if b == 0
        return 0
    end
    a + multiply(a, b-1)
end
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(num)
    return [] if num==0
    return [2] if num==1
    return [2,1] if num==2

    answer = lucas_sequence(num-1)
    answer << answer[-1] + answer[-2]
    answer
end
# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def is_prime?(num)
    (2...num).each do |ele|
        if num%ele==0
            return false
        end
    end
    num >2
end