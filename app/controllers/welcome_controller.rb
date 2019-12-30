class WelcomeController < ApplicationController

  skip_before_action :authorized, only: [:index]

  def index
    puts 'Helloooo!'
  end
end
