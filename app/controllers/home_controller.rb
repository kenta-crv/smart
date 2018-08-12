class HomeController < ApplicationController
before_action :authenticate_user!
  def index
     #worker_idがなかった時どのworkerにするのかは考えた方が良さそうです(takigawa/temy13)
     @worker = params[:worker_id].present? ? Worker.find(params[:worker_id].to_i) : current_user.company.workers.first
  	 @current = Time.now
     @current_attend = @worker.attends.started.last if @worker.present?
  end

  def show
  end


end
