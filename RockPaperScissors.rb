require 'sinatra'


before do
	#Before the route is even processed set a response as plain text
	content_type :txt
	#Setup a an array of viable moves that the server and computer can perform
	@defeat = { rock: :scissors, paper: :rock, scissors: :paper}
		#defeat is an array of object with key pairs 
	@throws = @defeat.keys
		#throws is an array of the  just the "keys" : rock, paper, scissors in this case
end

get '/throw/:type' do
#Play Mechanics Here

#the params[] hash stores querystring and form data 
player_throw = params[:type].to_sym 
	#the :type.to_sym converts plain text to a symbol object 
	#ex.	
	#s = 'cat'.to_sym       #=> :cat
	#s == :cat              #=> true


	# In the case the player provides a throw that is not valid, 
	# stop with a 403 Code and give them a warning to play a valid throw
	if !@throws.include?(player_throw)
	halt 403, "Your throw is not valid.  You must 'throw' one of the following: #{@throws}"
	end

	#Computer throws randomly
	computer_throw = @throws.sample
		# from the @throws array choose one random value, and store it as computer throw
	# Compare the thwo from the player to the computer and apply logic
	if player_throw == computer_throw
		"You tied with the computer. Throw again!"
	elsif computer_throw == @defeat[player_throw]
		"Nicely done; #{player_throw} beats #{computer_throw}!"
	else
		"Sorry: #{computer_throw} beats #{player_throw}. Throw again!"
	end

end