class AttendsController < MainController
  #ユーザー認証設定
  before_action :set_attend, only: [:show, :edit, :update, :destroy, :rest_time_start, :rest_time_end]

  # GET /attends
  # GET /attends.json
  def index
    @attends = Attend.all
  end

  # GET /attends/1
  # GET /attends/1.json
  def show
  end

  # GET /attends/new
  def new
    @attend = Attend.new
  end

  # GET /attends/1/edit
  def edit
  end

  # POST /attends
  # POST /attends.json
  def create
    @attend = Attend.new(attend_params)
    # @attend = Attend.new(user: current_user, start_at: Time.current)

    respond_to do |format|
      if @attend.save
        format.html { redirect_to @attend, notice: 'Attend was successfully created.' }
        # format.html { redirect_to root_path, notice: 'Attend was successfully created.' }
        format.json { render :show, status: :created, location: @attend }
      else
        format.html { render :new }
        # format.html { redirect_to root_path, notice: 'Attend was successfully created.' }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attends/1
  # PATCH/PUT /attends/1.json
  def update
    respond_to do |format|
      if @attend.update(attend_params)
        format.html { redirect_to @attend, notice: 'Attend was successfully updated.' }
        format.json { render :show, status: :ok, location: @attend }
      else
        format.html { render :edit }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attends/1
  # DELETE /attends/1.json
  def destroy
    @attend.destroy
    respond_to do |format|
      format.html { redirect_to attends_url, notice: 'Attend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @attend = Attend.new(user: current_user, start_at: Time.current)
    respond_to do |format|
      if @attend.save
        format.html { redirect_to root_path, notice: '出勤中です' }
      else
        format.html { redirect_to root_path, errors: @attend.errors }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end


  def finish
    # @attend = current_user.attends.find_by("attends.start_at >= ? and attends.end_at = ?", Time.current.at_beginning_of_day, nil)
    @attend = current_user.attends.started.last
    @attend.end_at = Time.current

    respond_to do |format|
      if @attend.save
        format.html { redirect_to root_path, notice: '退勤しました' }
      else
        format.html { redirect_to root_path, errors: @attend.errors }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  
  def rest_time_start
    @attend.rest_start_at = Time.current

    respond_to do |format|
      if @attend.save
        format.html { redirect_to root_path, notice: '休憩中です' }
      else
        format.html { redirect_to root_path, errors: @attend.errors }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  def rest_time_end
    @attend.rest_end_at = Time.current

    respond_to do |format|
      if @attend.save
        format.html { redirect_to root_path, notice: '出勤中です' }
      else
        format.html { redirect_to root_path, errors: @attend.errors }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attend
      @attend = Attend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attend_params
      params.require(:attend).permit(:user_id, :start_at, :end_at)
    end
end


