#log in
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
   session[:id] = @user.id
   redirect '/'
 else
  erb :'/sessions/new', locals: { errors: ["Invalid username or password"] }
  end
end

#logout
post '/sessions/logout' do
  session[:id] = nil
  redirect '/'
end
