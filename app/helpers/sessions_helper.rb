module SessionsHelper

  def log_in(username)
    session[:user] = username
  end

  def current_user
    @current_user = session[:user]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user)
    @current_user = nil
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
