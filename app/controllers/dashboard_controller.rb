class DashboardController < ApplicationController

  skip_before_action :authorized, only: [:index]

  def index
    @user = User.find_by(id: session[:current_user_id]) 
    foo = @user.to_json
    puts foo
    render json: @user
  end
end
