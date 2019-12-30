class DashboardController < ApplicationController

  def index
    @user = User.find_by(id: session[:current_user_id]) 
    render json: @user
  end
end
