#new
get '/users/new' do
  erb :'/users/new'
end

#create
post '/users' do
  @user = User.new(params[:user])
   if params[:user][:password].empty? || params[:user][:password].length < 8
     return erb :'/users/new', locals: { errors: ['Please create a password that is at least 8 characters long']}
   end
   @user.password = params[:user][:password]
    if @user.valid?
      @user.save!
      redirect '/'
    else
      erb :'/users/new', locals: { errors: @user.errors.full_messages }
    end
end
