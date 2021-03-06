# == Schema Information
#
# Table name: companies
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  worker_id          :integer
#  company            :string
#  company_short      :string
#  first_name         :string
#  last_name          :string
#  first_kana         :string
#  last_kana          :string
#  tel                :string
#  mobile             :string
#  fax                :string
#  e_mail             :string
#  postnumber         :string
#  prefecture         :string
#  city               :string
#  town               :string
#  caption            :string
#  labor_number       :string
#  employment_number  :string
#  trial_period       :date
#  work_start         :integer
#  break_in           :integer
#  break_out          :integer
#  work_out           :integer
#  holiday            :string
#  allowance          :string
#  allowance_contents :string
#  closing_on         :date
#  payment_on         :date
#  desuction          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Company < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :employments
    has_many :invoices
    has_many :infos
    has_many :workers
    has_many :pictures, dependent: :destroy
    belongs_to :user, optional: true


	validates :company, presence: true

end
