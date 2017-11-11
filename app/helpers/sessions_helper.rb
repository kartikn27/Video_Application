module SessionsHelper

  def log_in(username, access_token)
    session[:user] = username
    session[:user_token] = access_token
  end

  def current_user
    @current_user = session[:user]
  end

  def current_user_token
    @current_user_token = session[:user_token]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user)
    @current_user = nil
    @current_user_token = nil
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
