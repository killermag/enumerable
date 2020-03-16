module Enumerable
    def my_each
        length = self.length
        i = 0

        while i < length
            yield(self[i]) if block_given?
            i += 1
        end
    end

    def my_each_with_index
        length = self.length
        i = 0
        while i < length
            yield(self[i],i) if block_given?
            i = i + 1
        end
    end

    def my_select
        new_array = []
        length = self.length
        i = 0
        while i < length
            new_array.push(yield(self[i]))
            i = i + 1
        end
    puts new_array

    end

    def my_all
        len = self.length
        i = 0
        result = Array.new
        while i < len
        result.push(yield(self[i]))
        i += 1
        end
        result.my_each { |x|
        if x == false
            return "false"
            break
        end
        }
        print "True"

    end

    def my_none
        len = self.length
        i = 0
        while i < len
            if yield(self[i]) == true
                return "False"
            end
            i += 1
        end

        puts "True"
    end

    def my_any
        len = self.length
        i = 0
        while i < len
        if yield(self[i]) == true
            return "True"
            break
        end
        i += 1
        end
        print "false"
    end

    def my_count (arg=nil)
        return self.length if arg.nil?

        count = 0
        for num in self
            if num == arg
                count += 1
            end
        end
        count
    end

    def my_map (proc = nil)
        new_array = []
        i = 0
        
        while i < self.length

            if block_given? && !proc.nil?

                new_array.push(proc.call(self[i]))
            
            elsif block_given?
            
            new_array.push(yield(self[i])) 

            elsif proc

            new_array.push(proc.call(self[i])) 

            end
            
            i += 1
        end
        
        new_array
        
    end

    def my_inject
        len = self.length
        i = 0
        sum = 0
        while i < len
            sum += self[i]

            i += 1
        end
        print sum
    end



end

array = [1,2,3]

=begin
array.my_each {
    |x|
    puts x*2
}


array.my_each_with_index { |x,y| puts "#{x} and index: #{y}"}

puts array.my_select { |x|
     x == 1 ? x : nil  }

puts array.my_all {|x| x.is_a? Integer}

puts array.my_none {|x| x == 3}

puts array.my_all {|x| x == 1}
puts array.my_any {|x| x == 5}
puts array.my_count(1)
array.my_inject
puts array.my_map {|x| x*2 }
puts array.my_map {|x| x*2}
mul = Proc.new do |x| 
    x*2
end
puts array.my_map(mul)
=end


