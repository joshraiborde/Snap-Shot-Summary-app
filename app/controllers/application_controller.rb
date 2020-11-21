require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enables the sessions hash
    enable :sessions
    #enables the user to login
    #set a session secret for an extra layer of security
    set :session_secret, "super_secret_session"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
    end
  end

  helpers do

    # returns a boolean if the user is logged in or not
     def logged_in?
      !!current_user
     end


    # keeps track of the logged in user
    def current_user
      User.find_by(id: session[:user_id])
      #User.find(session[:user_id])
      #allows us to leverage the login user anywhere where in the controllers where it is inheriting from the application controller
    end
  end

end
