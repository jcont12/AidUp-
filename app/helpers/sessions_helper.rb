helpers do
  def session_user
    User.find(session[:id])
  end
end
