module SessionsHelper
  
  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logout(user)
    session.delete(:user_id)
    @current_user = nil
  end
end
