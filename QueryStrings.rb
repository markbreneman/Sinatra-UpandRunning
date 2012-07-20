require 'sinatra'

get '/:name'  do
	#assumes a URL in the form of /some_name?foo=XYZ
	"You asked for #{{params[:name]}} as well as #{params[:foo]}"
end