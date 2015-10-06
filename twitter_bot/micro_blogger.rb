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

	def run
		puts "Welcome to the JSL Twitter Client!"
	end
end

blogger = MicroBlogger.new
blogger.run
