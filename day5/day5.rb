input = File.read("day5.txt")

def getUnits(str) 
	alphabet = ('a'..'z').to_a
	weEndItAll = false

	until weEndItAll
		alphabet.each { |letter|
			m = /#{letter}#{letter.upcase}|#{letter.upcase}#{letter}/.match(str)	
			if m != nil 
				weEndItAll = false
				str = str.gsub(/#{letter}#{letter.upcase}|#{letter.upcase}#{letter}/, '')
				break
			end
			weEndItAll = true
		}
	end

	return str.length
end

# Part 1
puts getUnits(input)

def getShortestPolymer(str)
	shortest = 0
	alphabet = ('a'..'z').to_a

	alphabet.each { |letter|
		s = str.gsub(/#{letter}|#{letter.upcase}/, '')
		units = getUnits(s)

		if shortest == 0 || units < shortest 
			shortest = units
		end
	}

	return shortest
end

# Part 2
puts getShortestPolymer(input)