post '/users' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:id] = @user.id
    redirect '/'
  else
    erb :'/login', locals: { errors: ["invalid username or password"] }
  end
end


post '/users/new' do
  @user = User.new(params[:user])
  if params[:user][:password].empty? || params[:user][:password].length < 8
    return erb :'/register', locals: { errors: ['Must provide a password that is at least 8 characters long']}
  end
  @user.password = params[:user][:password]
  if @user.valid?
    @user.save!
    redirect '/'
  else
    erb :'/register', locals: { errors: @user.errors.full_messages}
  end
end


post '/logout' do
  session[:id] = nil
  redirect '/'
end
