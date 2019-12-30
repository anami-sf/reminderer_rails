class DashboardController < ApplicationController

  def index
    @user = User.find_by(id: session[:current_user_id]) 
    #render json: @user
    respond_to do |format|
      #format.html # index.html.erb
      format.json { render json: @user }
  end
end
