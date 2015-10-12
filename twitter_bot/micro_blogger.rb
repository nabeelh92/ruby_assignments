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
		puts "message posted successfully!"
	  end
	end

	def dm(target, message)
		puts "Trying to send #{target} this message:"
		puts message

		screen_names = @client.followers.map { |follower| follower.screen_name }
		if screen_names.include?(target)
		  message = "d #{target} #{message}"
		  tweet(message)
		else
		  puts "ERROR, can only send direct messages to followers."
		end
	end

	# returns list of your followers
	def followers_list
	    screen_names = []
	    @client.followers.each { |follower| screen_names << follower['screen_name'] }
	    screen_names
	end


	def spam_my_followers(message)
		list = followers_list
		list.each { |f| dm(f, message)}
	end

	def everyone_last_tweet
		friends = @client.friends
		friends.each do |friend|
		  timestamp = friend.status.creadted_at
		  puts "#{friend.screen_name.upcase} (#{timestamp.strftime("%b %d")}): #{friend.status.text}"
		  puts "\n"
		end
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
			  when 'dm' then dm(parts[1], parts[2..-1].join(" "))
			  when 'spam' then spam_my_followers(parts[1..-1].join(" "))
			  when 'elt' then everyone_last_tweet
			  else
			  	puts "Sorry I dont know how to do #{command}"
			end

		end
	end
end

blogger = MicroBlogger.new
blogger.run
