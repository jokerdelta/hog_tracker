require 'pry'

class UserController < ApplicationController

  get '/users/:id/show' do
    @user = User.find_by(id: params[:id])
      if  logged_in? == false || current_user.id != @user.id
    erb :'users/login'
    else
      erb :'/users/show'
    end
  end

  get '/users/:id/edit' do
    if logged_in?
      @user = User.find_by(id: params[:id])
          if @user.id == current_user.id #only allow edit if current user is hogs owner
              erb :'users/edit_user'
          else
            redirect to '/login'
          end
    else
      redirect to '/login'
    end
  end

  patch '/users/:id' do
    if logged_in?
        if params[:username] == "" # if username is blank, redirect back to edit page and do not save
          redirect to "/users/#{params[:id]}/edit"
        else
          @user = User.find_by(id: params[:id])
          @user.username = params[:username]
          @user.email = params[:email]
          @user.fair_date = params[:fair_date]
          @user.save
          redirect to "/users/#{@user.id}/show"
      end
    else
      redirect to '/login'
    end
end

  get '/signup' do
        if logged_in? == false
        erb :'/users/create_user'
      else
        redirect to "/users/#{@user.id}/show"
      end
  end

  post '/signup' do
          @user = User.new(username: params[:username], password: params[:password], email: params[:email], fair_date: params[:fair_date])
              if @user.valid? && logged_in? == false
          @user.save
          session[:user_id] = @user.id
          redirect to  "/users/#{@user.id}/show"
      else
          redirect to '/signup'
      end
    end

  get '/login' do
    if logged_in? == false
    erb :'users/login'
    else
      redirect to "/users/#{@user.id}/show"
    end
  end

  post '/login' do
     @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect to "/users/#{@user.id}/show"
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
