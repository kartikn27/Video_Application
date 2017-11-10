class SessionsController < ApplicationController

  def new
  end

  def login
    login_url = 'https://login.zype.com/oauth/token'

    authentication_payload = {I18n.t("authentication_payload.client_id") => I18n.t("client_id"),
                               I18n.t("authentication_payload.client_secret") => I18n.t("client_secret"),
                               I18n.t("authentication_payload.username") => params[:session][:email],
                               I18n.t("authentication_payload.password") => params[:session][:password],
                               I18n.t("authentication_payload.grant_type") => I18n.t("authentication_payload.password")}

    response = RestClient.post login_url, authentication_payload

    print(response.code.eql?(200))
    print(JSON.parse(response.body)['access_token'])



    if response.code.eql?(200)
      log_in params[:session][:email]
      redirect_to '/'
    else
      format.html { redirect_to '/login', danger: 'Failed to login' }
    end





    # if response.code != 200
    #   print("Not 200")
    #   format.html { redirect_to '/login', danger: 'Failed to login' }
    # end

  end

end
