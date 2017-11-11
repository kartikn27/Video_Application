class SessionsController < ApplicationController

  def new
  end

  def login
   response = make_login_request
   user_obj = JSON.parse(response.body)

    if response.code.eql?(200)
      log_in params[:session][:email], user_obj['access_token']
      redirect_to root_path
    else
      format.html { redirect_to '/login', danger: 'Failed to login' }
    end

  end

  private

  def make_login_request
    login_url = I18n.t('login_url')
    authentication_payload = {I18n.t('authentication_payload.client_id') => Rails.application.secrets[:client_id],
                              I18n.t('authentication_payload.client_secret') => Rails.application.secrets[:client_secret],
                              I18n.t('authentication_payload.username') => params[:session][:email],
                              I18n.t('authentication_payload.password') => params[:session][:password],
                              I18n.t('authentication_payload.grant_type') => I18n.t('authentication_payload.password')}

    response = RestClient.post login_url, authentication_payload
    response
  end

end
