class HomeController < ApplicationController
before_action :authenticate_user!
  def index
  	 @current = Time.now 
     @current_attend = current_user.attends.started.last if current_user.present?
  end

  def show
  end
  
  
end