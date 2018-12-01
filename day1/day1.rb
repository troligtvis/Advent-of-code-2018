values = []
File.open("aoc2018_day11.txt", "r").each do |line| 
	values << line
end

#part1
freq = 0

values.each do |value|
	freq += value.to_i
end

puts freq

#part 2
freq = 0
i = 0

hashmap = { freq => true }

hasDupFreq = false
until hasDupFreq do
	if i > values.length - 1
		i = 0
	end

	freq += values[i].to_i
	hasDupFreq = hashmap[freq]
	hashmap[freq] = true
	i += 1
end

puts freq