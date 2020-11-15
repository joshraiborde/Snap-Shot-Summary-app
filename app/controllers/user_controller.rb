class UserController < ApplicationController
    
    # render a login form
    get "/login" do
        erb :login 
    end

    # reveive the data (params) from the login form
    post "/login" do
        # find the user
        user = User.find_by(email: params[:email])
        # authenticate the user
        if user && user.authenticate(params[:password])# if this user is truthy and if the user has been authenticated, then log them in, the authenticate method comes from snap_shot_summary_app/app/models/user.rb file's 'has_secure_password'.
        # creating a key/value pair in the session hash using the users id to actually logs them in
        session[:user_id] = user.id
        # redirect user's profile (users show)
        redirect "/users/#{user.id}"
        else
            # show an error message
            redirect '/login'
        end
    end

    # users SHOW route
    get "/users/:id" do
        "users show page!"
    end

end