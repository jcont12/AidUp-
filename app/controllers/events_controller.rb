#index
get '/users/:user_id/events' do
  @events = Event.where(creator_id: params[:user_id])
  @user = User.find(params[:user_id])
  erb :'/events/index'
end

#new
get '/users/:user_id/events/new' do
  @user = User.find(params[:user_id])
  erb :'/events/new'
end

post '/users/:user_id/events' do
  @user = User.find(params[:user_id])
  @event = Event.new(title: params[:title], location: params[:location], date: params[:date], creator_id: params[:user_id])
  if @event.valid?
    @event.save!
    redirect "/users/#{:params[:user_id]}/events/#{@event.id}"
  else
    erb :'/events/new', locals: { errors: @event.errors.full_messages }
  end
end

#show
get '/users/:user_id/events/:id' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:id])
  erb :'/events/show'
end

#edit
get '/users/:user_id/events/:event_id/edit' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:event_id])
    erb :'/events/edit'
end

post '/users/:user_id/events/:id' do
  @user = User.find(params[:user_id])
  @event = Event.find(params[:id])
  @event.update_attributes(title: params[:title], location: params[:location], date: params[:date], creator_id: params[:user_id])
  redirect "/users/#{@user.id}/events/#{@event.id}"
end
