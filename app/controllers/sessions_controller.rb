
class SessionsController < ApplicationController

  skip_before_action :authorized, only: [ :googleAuth ]

  def googleAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        puts('*******************request.env: ', access_token)
        user = User.from_omniauth(access_token)
        puts('*******************user: ', user.id)
        session[:current_user_id] = user.id
        puts('*******************1-session[user]: ', session[:current_user_id])
        # Access_token is used to authenticate request made from the rails application to the google server
        user.google_token = access_token.credentials.token
        puts('*******************authenticated: ', user.google_token)
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        user.google_refresh_token = refresh_token if refresh_token.present?
        user.save
        puts('*******************2-session[user]: ', session[:current_user_id]) 
        # redirect_to root_path
        # if user 
        #   render json: {
        #     logged_in: true,
        #     user: user
        #   }
        # else
        #   render json: { 
        #     status: 401,
        #     errors: ['no such user', 'verify credentials and try again or signup']
        #   }
        # end
  end
end
