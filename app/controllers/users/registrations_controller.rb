# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController


  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
        layout "top", only: [:new]
  # GET /resource/sign_up
  def new
    super
    @company = Company.new
    @employment = Employment.new
  end

  # POST /resource
  def create
    @company = Company.new(company_params)
    @employment = Employment.new(employment_params)
    if @company.valid? && @employment.valid?
      super do |resource|
        if resource.errors.present?
          logger.debug resource.errors
          render :new and return
        end
        @company.user = resource
        @company.save
        @employment.company = @company
        @employment.user = resource
        @employment.save
        #resource.update(company: @company)
      end
    else
      build_resource(sign_up_params)
      render :new
    end
  end


  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  protected

  def after_sign_up_path_for(resource)
    new_worker_path
  end

   private
    def company_params
      params.require(:company).permit(
      :company,
      :first_name,
      :last_name,
      :first_kana,
      :last_kana,
      :tel,
      :mobile,
      :fax,
      :e_mail,
      :postnumber,
      :prefecture,
      :city,
      :town,
      :caption,
      :labor_number,
      :employment_number
    )
    end


   private
    def employment_params
      params.require(:employment).permit(
      :trial_period,
      :work_start,
      :break_in,
      :break_out,
      :work_out,
      :holiday,
      :allowance,
      :allowance_contents,
      :closing_on,
      :payment_on,
      :method_payment,
      :desuction
      )
      end

end
