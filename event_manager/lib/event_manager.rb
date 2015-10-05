require "csv"
require "sunlight/congress"

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

	legislator_names = legislators.collect do |legislator|
    	"#{legislator.first_name} #{legislator.last_name}"
  	end

  	legislator_string = legislator_names.join(", ")
end


puts "Event manager initialized."

=begin
def clean_zipcode(zipcode)
	if zipcode.nil?
		"00000"
	elsif zipcode.length < 5
		zipcode = zipcode.rjust(5,"0")
	elsif zipcode.length > 5
		zipcode = zipcode[0..4]
	else
		zipcode
	end
end
=end



contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol


contents.each do |row|
	name = row[:first_name]
	zipcode = clean_zipcode( row[:zipcode] )

	legislators = legislators_by_zipcode(zipcode)
	
	puts "#{name} #{zipcode} #{legislators}"
end