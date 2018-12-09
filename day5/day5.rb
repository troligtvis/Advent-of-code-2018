input = File.read("day5.txt")
alphabet = ('a'..'z').to_a
whiletrue = true

while whiletrue
	alphabet.each { |letter|
		m = /#{letter}#{letter.upcase}|#{letter.upcase}#{letter}/.match(input)	
		if m != nil 
			whiletrue = true
			input = input.gsub(/#{letter}#{letter.upcase}|#{letter.upcase}#{letter}/, '')
			break
		end
		whiletrue = false
	}
end

puts input