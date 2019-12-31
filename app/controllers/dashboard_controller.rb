class DashboardController < ApplicationController

  skip_before_action :authorized, only: [:index]
  after_action :add_headers

  def index
    @user = User.find_by(id: session[:current_user_id]) 
    puts( '****************jsonuser: ', json: @user)
    render json: @user 
  end

  def add_headers
    #response.headers['test-controller-header'] = 'test-controller-header-value'
    response.headers['Access-Control-Allow-Origin'] = 'http://localhost:3001'
  end
end
