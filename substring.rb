def substrings(str, dictionary)

	subs = Hash.new(0)


	str.downcase.split(/[^\w']+/).each do |word|
		dictionary.each do |substring|

			subs[substring] += 1 if word[substring]
		
		end
	end

	return subs
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]


#puts substrings("below", dictionary).inspect

puts substrings("Howdy partner, sit down! How's it going?", dictionary).inspect