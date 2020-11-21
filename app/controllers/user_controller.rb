class UserController < ApplicationController
    
    # render a login form
    get "/login" do
        erb :login 
    end

    # reveive the data (params) from the login form
    post "/login" do
        # find the user
        @user = User.find_by(email: params[:email])
        # authenticate the user
        if @user && @user.authenticate(params[:password])# if this user is truthy and if the user has been authenticated, then log them in, the authenticate method comes from snap_shot_summary_app/app/models/user.rb file's 'has_secure_password'.
        # creating a key/value pair in the session hash using the users id to actually logs them in
        session[:user_id] = @user.id
        # redirect user's profile (users show)
        redirect "/users/#{@user.id}"
        else
            # show an error message
            redirect '/login'
        end
    end

    # users SHOW route
    get "/users/:id" do
        # binding.pry
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    # SIGN UP
    # get sign up route that renders signup form
    get '/signup' do
        #render sign up form
        erb :signup
    end

    # post sign up route that recieve input data from user, create theuser, and logs user in
    post '/users' do
        @user = User.new(params)
        if @user.save
          #creating a session, adding a key/value pair to session hash
          session[:user_id] = @user.id
          # redirect to user profile
          redirect "/users/#{@user.id}"
        else
          #not valid input
          redirect '/signup'
        end
      end



    # LOG OUT
    # get logout that clears the session hash
    get '/logout' do
        # binding.pry
        session.clear
        # binding.pry
        # redirect to home page
        redirect '/'
    end

end