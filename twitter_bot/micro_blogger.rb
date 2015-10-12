require 'jumpstart_auth'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "initializing Microblogger...."
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
	  if(message.length > 140)
	    puts "ERROR, you message has to be 140 characters or less"
	  else	
		@client.update(message)
	  end
	end

	def dm(target, message)
		puts "Trying to send #{target} this message:"
		puts message
		message = "d @#{target} #{message}"
		tweet(message)
	end

	def run
		puts "Welcome to the JSL Twitter Client!"
		command = ""
		while command != "q" 
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]

			case command
			  when 'q' then puts "Goodbye!"
			  when 't' then tweet(parts[1..-1].join(" "))
			  when 'dm' then dm(parts[1], parts[2..-1].joing(" "))
			  else
			  	puts "Sorry I dont know how to do #{command}"
			end

		end
	end
end

blogger = MicroBlogger.new
blogger.run
