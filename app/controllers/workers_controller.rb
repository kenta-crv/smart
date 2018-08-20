class WorkersController < ApplicationController
  # before_action :set_worker, only:  [:show, :edit, :update, :destroy, :print]
before_action :authenticate_user!

  def index
  	 @workers = Worker.all.order(created_at: 'desc')
  end

  def show
  	@worker = Worker.find_by(id: params[:id])
  end

  def new
    @worker = Worker.new
  end

 def create
     # render plain: params[:post].inspect
    # save
    # @post = Post.new(params[:post])
    # @post = Post.new(params.require(:post).permit(:title, :body))
    @workers = Worker.new(worker_params)
    if @workers.save
        # redirect
        redirect_to workers_path
    else
        render 'new'
    end
  end

  def edit
    @workers = Worker.find(params[:id])
  end

 def update
    @workers = Worker.find(params[:id])
     if @workers.update(worker_params)
        redirect_to workers_path
    else
        render 'edit'
    end
 end

 def destroy
    @workers = Worker.find(params[:id])
    @workers.destroy
    redirect_to workers_path
 end

def salary
  @workers = Worker.all
  @d = Date.today
end

  # 帳票出力処理
  def print
    report = Thinreports::Report.new layout: "app/reports/layouts/salary.tlf"
    report.start_new_page
    report.page.values(
      company_name: "サンプル",
      # company_name: @worker.management.try(:company),
      paid_month: "2018年7月度 (7/1 - 7/31)",
      user_name: "山田一郎",
      # user_name: @worker.user.try(:name),
      work_days: current_user.attends.count
      # work_days: 19
      # work_days: current_user.attends.where(" ? <= start_at and start_at < ? ", Time.local(2018,7,1,0,0,0), Time.local(2018,8,1,0,0,0)).count
    )
    report.page.list do |list|
      # sub_total = 0
      # total = 0

      # # Dispatch at list-page-footer insertion.
      # list.on_page_footer_insert do |page_footer|
      #   # Set subtotal.
      #   page_footer.item(:sub_total).value(sub_total)
      #   # Initialize subtotal to 0.
      #   sub_total = 0
      # end

      # # Dispatch at list-footer insertion.
      # list.on_footer_insert do |footer|
      #   # Set total.
      #   footer.item(:total).value(total)
      # end

      # Array(current_user.attends.where(" ? <= start_at and start_at < ? ", Time.local(2018,7,1,0,0,0), Time.local(2018,8,1,0,0,0))).each.with_index(1) do |item, idx|
      # (1..3).each.with_index(1) do |_sample, idx|
      Array(current_user.attends).each.with_index(1) do |item, idx|
        # Add an row of list.
        _start_at = item.start_at.present? ? I18n.l(item.start_at, format: :xs) : nil
        _end_at   = item.end_at.present? ? I18n.l(item.end_at, format: :xs) : nil
        _rest_start_at = item.rest_start_at.present? ? I18n.l(item.rest_start_at, format: :xs) : nil
        _rest_end_at = item.rest_end_at.present? ? I18n.l(item.rest_end_at, format: :xs) : nil
        list.add_row({
          no: idx,
          work_on: I18n.l(item.start_at.to_date),
          work_time: "#{_start_at}-#{_end_at}",
          # work_on: Date.today + idx.days,
          # work_time: "9:55-18:13",
          rest_time1: "#{_rest_start_at}-#{_rest_end_at}",
          rest_time2: "",
          unit_price: 1200,
          #それぞれの値を抽出
          amount: 7,
          price: 8400,
          other_price: 600,
        })
        # list.add_row do |row|
        #   row[:rate].value("#{item.rate}THB")
        # end

        # # Calculate the amount.
        # sub_total += item.amount
        # total += item.amount
      end
    end
    send_data(report.generate, filename: "worker-#{Time.zone.now.to_formatted_s(:number)}.pdf", type: "application/pdf")
  end


  private
    def set_worker
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(
      :first_name,
      :last_name,
      :tel,
      :e_mail,
      :post_number,
      :address,
      :birthday,
      :classification,
      :authority,
      :hire_date,
      :departure_date,
      :affiliation
      )
    end

end
