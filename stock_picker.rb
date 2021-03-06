def stock_picker(prices)
	
	#vim comment

	puts '[ ' + prices.join(' ') + ' ]'

	if prices.length <= 0
		puts "need more to input days+prices!!"
		#return nill #need a return value
	end

	if prices.length < 2
		puts "need more stock prices for later days!!"
		#return nill #need a return value
	end

	current_best_profit = prices[1] - prices[0]
	current_best_dates = [0,1]

	prices.each_with_index do |buy_price, buy_day|
		(buy_day...prices.length).each_with_index do |sell_day|
			sell_price = prices[sell_day]
			if(sell_price - buy_price > current_best_profit)
				current_best_profit = sell_price - buy_price
				current_best_dates = [buy_day, sell_day]
			end 
		end
	end

	#return current_best_dates.join(' ')
	return '[ ' + current_best_dates.join(' ') + ' ] ' + 'for a profit of : ' + current_best_profit.to_s 
end

puts 'test 1'
puts stock_picker([17,3,6,9,15,8,6,1,10])
puts 'test 2'
puts stock_picker([44,42,4,5,42,2,40,5])
