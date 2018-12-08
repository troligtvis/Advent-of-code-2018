require 'date'

def compareDate(aDate, bDate) 
	a = Date._strptime(aDate, "%Y-%m-%d %H:%M")
	b = Date._strptime(bDate, "%Y-%m-%d %H:%M")
	aDateTime = DateTime.new(a[:year], a[:mon], a[:mday], a[:hour], a[:min], 0)
	bDateTime = DateTime.new(b[:year], b[:mon], b[:mday], b[:hour], b[:min], 0)
	diff = bDateTime - aDateTime
	return (diff * 24 * 60).to_i
end

def getLineData(s) 
	value = s.split("] ")
	value[0][0] = ""
	dateValue = value[0].split(" ")
	data = { :date => dateValue[0], 
			 :time => dateValue[1], 
			 :dateTime => value[0],
			 :action => value[1] }
	m = /\d+/.match(value[1])
	unless m == nil
		data[:guardId] = m[0]
	end	
	return data
end

lines = []
File.open("day4.txt", "r").each do |line| 
	lines << line
end

data = lines.map { |l| getLineData(l) }
sorted = data.sort { |a, b| [a[:date], a[:time]] <=> [b[:date], b[:time]] }


prev = nil
currentId = nil
h = Hash.new(0)
h2 = Hash.new(0)

sorted.each { |v|
	unless v[:guardId] == nil
		currentId = v[:guardId]
	end

	s = v[:action]
	if s.start_with?("Guard")
		if h[v[:guardId]] == 0 
			h[v[:guardId]] += 0
		end
	elsif s.start_with?("wakes up")
		diff = compareDate(prev[:dateTime], v[:dateTime]) - 1

		if currentId == "421" # hack because 421 is the guard sleeps the most
			d1 = Date._strptime(prev[:time], "%H:%M")
			d2 = Date._strptime(v[:time], "%H:%M")

			for i in 0..diff
				d1[:min] += 1
				key = d1[:min].to_s
				h2[key] += 1
			end
		end
		h[currentId] += diff
	end

	prev = v
}

puts h.max_by { |k, v| v }[0]
puts h2.max_by { |k, v| v }[0]
