# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    #count from 2 to the first number inclusive
    #if first and second number can evenly divide by num, then divide second num by num
    #multiply first and what's left of second
    (2..num_1).each do |num|
        if num_1 % num == 0 && num_2 % num == 0
            num_2 = num_2 / num
        end
    end
    num_1 * num_2
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new(0)
    (0...str.length-1).each do |idx|
        characters = str[idx] + str[idx+1]
        bigrams[characters] += 1
    end
    bigrams = bigrams.sort_by {|k, v| v }
    bigrams[-1][0]
    
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = {}
        self.each do |k, v|
            new_hash[v] = k
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        #iterate through the array with (0...length)
        #have counter and nested loop
        #add plus one for each time it equals num
        counter = 0
        (0...self.length-1).each do |i|
            (i...self.length).each do |j|
                if self[i] + self[j] == num
                    counter += 1
                end
            end
        end
        counter
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        prc ||= Proc.new { |ele1, ele2| ele1 <=> ele2 }
        
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |idx|
                if prc.call(self[idx], self[idx+1]) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx]
                    sorted = false
                end
            end
        end
        self
    end
end
