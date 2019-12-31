class DashboardController < ApplicationController

  skip_before_action :authorized, only: [:index]

  def index
    @user = User.find_by(id: session[:current_user_id]) 
    puts( '****************jsonuser: ', json: @user)
    render json: @user
  
  end
end
