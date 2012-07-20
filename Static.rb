require 'sinatra'

get '/static.html'  do
	#the below content is not deliverd if there is a public folder with static.html in it
	'this is delivered via the route'
end