class UserController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
        if logged_in? == false
        erb :'/users/create_user'
      else
        redirect to '/hogs'
      end
  end

  post '/signup' do
      @user = User.new(username: params[:username], password: params[:password], email: params[:email])
        if @user.valid? && logged_in? == false
          @user.save
          session[:user_id] = @user.id
          redirect to '/hogs'
      else
          redirect to '/signup'
      end
    end

  get '/login' do
    if logged_in? == false
    erb :'users/login'
    else
      redirect to '/hogs'
    end
  end

  post '/login' do
     @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to '/hogs'
      else
        redirect to '/signup'
      end
  end

  get "/logout" do
    if logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
