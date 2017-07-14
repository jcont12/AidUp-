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
    redirect '/'
  else
    erb :'/events/new', locals: { errors: @event.errors.full_messages }
  end
end

#show
get '/users/:user_id/events/:event_id' do
  erb :'/events/show'
end
