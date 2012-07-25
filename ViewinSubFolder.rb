require 'sinatra'

get '/:user/profile' do 
	erb '/user/profile'.to_sym
	# to convert the path profile to string use .to_sym Notation

end

get '/:user/help' do
	erb :'/user/help'
	# to convert the path profile to string use .to_sym Notation
end