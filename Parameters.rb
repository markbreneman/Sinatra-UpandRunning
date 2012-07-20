require 'sinatra'
#route is based a parameter :name

get '/:name' do
 #using the route parameter in the code.
"Hello, #{params[:name]}!"
end