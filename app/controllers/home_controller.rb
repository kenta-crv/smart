class HomeController < ApplicationController
before_action :authenticate_user!
  def index
     #worker_idがなかった時どのworkerにするのかは考えた方が良さそうです(takigawa/temy13)
     @worker = Worker.find(params[:worker_id].to_i) if params[:worker_id].present?
  	 @current = Time.now
     @current_attend = @worker.attends.started.last if @worker.present?
  end

  def show
  end


end
