class PostsController < ApplicationController


    # CRUD

    # READ
    #index route for all posts
    get '/posts' do
        # leverae the model to get all posts from database
        @posts = Post.all
        #render all posts
        erb :'posts/index'
    end

    # CREATE
    # render a form to create a new post
    get '/posts/new' do
        erb :"posts/new"

    end

    # need another route for create
    post "/posts" do
        #recieve the params that the user inputs in the create new form
        post = Post.create(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
        #redirect to the post show page
        redirect "/posts/#{post.id}"
    end

    # ORDER MATTERS
    #show route for a single post
    get '/posts/:id' do
        # find the post
        @post = Post.find(params[:id])
        erb :"/posts/show"
    end



    # UPDATE
    # edit button that routes to the form
    # render an edit form
    # patch method/route that will update the post


    #DELETE


end