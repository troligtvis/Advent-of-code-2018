values = []
File.open("day2.txt", "r").each do |line| 
	values << line
end

twoos = 0
threes = 0

values.each { |value|
	counts = Hash.new(0)
	value.split("").sort.each { |v| counts[v] += 1 }

	foundTwo = false
	foundThree = false
	counts.each { |k, v|
		if (v == 2 && !foundTwo)
			foundTwo = true
			twoos += 1
		elsif (v == 3 && !foundThree)
			foundThree = true
			threes += 1
		end	
	}
}

puts twoos * threes

values.each_with_index { |value, i|
  values[i + 1..values.size].each { |other|
    noOfDiff = value.each_char.with_index.count { |c, ci| 
    	c != other.chars[ci]
    }

    if noOfDiff == 1 
    	res = []
    	value.each_char.with_index { |d, vi|
    		if d == other.chars[vi] 
    			res << d
    		end
    	}

    	puts [res.join]
    end
  }
}