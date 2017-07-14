get '/' do
  if session[:id]
    @user = User.find(session[:id])
  end
    @events = Event.all
  erb :index
end
