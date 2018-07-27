class EmploymentsController < ApplicationController
before_action :authenticate_user!
  def index
  	 @employments = Employment.all.order(created_at: 'desc')
  end
  
  def show
  	@employment = Employment.find(params[:id])
  end
  
  def new
    @employment = Employment.new
  end
 
 def create
    @employment = Employment.new(employment_params)
    if @employment.save
        # redirect
        redirect_to employments_path
    else
        render 'new'
    end
  end
  
  def edit
    @employment = Employment.find(params[:id])
  end

 def update
    @employment = Employment.find(params[:id])
     if @employment.update(employment_params)
        redirect_to employments_path
    else
        render 'edit'
    end      
 end
 
 def destroy
    @employment = Employment.find(params[:id])
    @employment.destroy
    redirect_to employments_path
 end

  private
    def employment_params
      params.require(:employment).permit(
      :trial_period, #試用期間
      :work_start, #勤務開始時間
      :break_in, #休憩開始時間
      :break_out, #休憩終了時間
      :work_out, #勤務終了時間
      :holiday, #休日
      :allowance, #手当
      :allowance_contents, #手当詳細
      :closing_on, #給料締め日
      :payment_on, #給料支払い日
      :method_payment, #支払方法
      :desuction #控除
)
    end    


end
