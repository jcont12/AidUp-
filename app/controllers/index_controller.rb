get '/' do
  erb :index
end

get '/register' do
  erb :register
end

get '/login' do
  erb :login
end

# get '/new_page' do
#   if session[:id]
#     erb :new_page
#   else
#     redirect '/'
#   end
# end
