require 'sinatra/base'
require './model'

class Blog < Sinatra::Base
	get '/news' do
		news = News.get_all
		haml :news, :locals => {:news => news}
	end

	{'/' => :index, '/gowork' => :gowork}.each do |route, page|
		get route do
			haml  page
		end
	end

	get '/gosleep' do
		haml :sleep, :layout => false
	end

	{'work' => 'Continue working','sleep' => "Time to sleep"}.each do |action, msg|
		route = "/#{action}"
		get route do
			haml :remind, :locals => {:action => action, :msg => msg, :got_url => "/go#{action}"}
		end
	end
end

