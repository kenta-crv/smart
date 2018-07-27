class CompaniesController < ApplicationController
before_action :authenticate_user!

  def index
  	 @companies = Company.all.order(created_at: 'desc')
  end
  
  def show
  	@company = Company.find(params[:id])
  end
  
  def new
    @company = Company.new
  end
 
 def create
    @company = Company.new(company_params)
    if @company.save
        # redirect
        redirect_to companies_path
    else
        render 'new'
    end
  end
  
  def edit
    @company = Company.find(params[:id])
  end

 def update
    @company = Company.find(params[:id])
     if @company.update(company_params)
        redirect_to companies_path
    else
        render 'edit'
    end      
 end
 
 def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
 end

  private
    def company_params
      params.require(:company).permit(
      :company, #会社名
      :first_name, #苗字
      :last_name, #名前
      :first_kana, #ミョウジ
      :last_kana, #ナマエ
      :tel, #電話番号
      :mobile, #携帯番号
      :fax, #FAX番号
      :e_mail, #メールアドレス
      :postnumber, #郵便番号
      :prefecture, #都道府県
      :city, #市町村
      :town, #市町村以降
      :caption, #資本金
      :labor_number, #労働保険番号
      :employment_number, #雇用保険番禺
)
    end    




end
