class HogController < ApplicationController

  get '/hogs/new' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      erb :'hogs/create_hog'
    else
      redirect to '/login'
    end
  end

  get '/hogs/:id' do
    if logged_in?
      @hog = Hog.find_by(id: params[:id])
      erb :'hogs/show_hog'
    else
      redirect to '/login'
    end
  end

  get '/hogs/:id/edit' do
     if logged_in?
      @hog = Hog.find_by(id: params[:id])
           if @hog.user_id == current_user.id #only allow edit if current user is hogs owner
              erb :'hogs/edit_hog'
           else
             redirect to "/users/#{@hog.user_id}/show"
           end
     else
       redirect to '/login'
     end
  end

  patch '/hogs/:id' do
    # raise params.inspect
    if logged_in?
        if params[:name] == "" # if hog name is blank, redirect back to edit page and do not save
          redirect to "hogs/#{params[:id]}/edit"
        else
          @hog = Hog.find_by(id: params[:id])
          @hog.name = params[:name]
          @hog.weight.update(params[:weight]) #there is a problem here!
          # @hog.weight.week_1 = params[:week_1]
          # @hog.weight.week_2 = params[:week_2]
          # @hog.weight.week_3 = params[:week_3]
          # @hog.weight.week_4 = params[:week_4]
          # @hog.weight.week_5 = params[:week_5]
          # @hog.weight.week_6 = params[:week_6]
          # @hog.weight.week_7 = params[:week_7]
          # @hog.weight.week_8 = params[:week_8]
          # @hog.weight.week_9 = params[:week_9]
          # @hog.weight.week_10 = params[:week_10]
          # @hog.weight.week_11 = params[:week_11]
          # @hog.weight.week_12 = params[:week_12]
          # @hog.weight.week_13 = params[:week_13]
          # @hog.weight.week_14 = params[:week_14]
          # @hog.weight.week_15 = params[:week_15]
          @hog.weight.save
          @hog.save
          redirect to "/users/#{@hog.user_id}/show"
      end
    else
      redirect to '/login'
    end
end

delete'/hogs/:id/delete' do
   if logged_in?
  @hog = Hog.find_by(id: params[:id])
         if @hog.user_id == current_user.id # if current user is hogs owner, allow delete
          @hog.delete
          redirect to "/users/#{@hog.user_id}/show"
         else
           redirect to "/users/#{@hog.user_id}/show"
         end
   else
     redirect to '/login'
   end
end

get '/hogs' do
  if logged_in?
    @users = User.all
    erb :'hogs/hogs'
  else
    redirect to '/login'
  end
end

post '/hogs' do
  if logged_in?
    if params[:name] == " " #does not allow creation of new hog if name is blank
      redirect to '/hogs/new'
    else
      @hog= Hog.create(name: params[:name], user_id: session[:user_id])
      @weight = Weight.create(week_1: params[:week_1], week_2: params[:week_2], week_3: params[:week_3], week_4: params[:week_4], week_5: params[:week_5],
      week_6: params[:week_6], week_7: params[:week_7], week_8: params[:week_8], week_9: params[:week_9], week_10: params[:week_10], week_11: params[:week_11],
      week_12: params[:week_12], week_13: params[:week_13], week_14: params[:week_14], week_15: params[:week_15], hog_id: @hog.id)
      redirect to  "/hogs/#{@hog.id}"
    end
  else
    redirect to '/login'
  end
end



end
