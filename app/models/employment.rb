# == Schema Information
#
# Table name: employments
#
#  id                 :integer          not null, primary key
#  trial_period       :string
#  work_start         :string
#  break_in           :string
#  break_out          :string
#  work_out           :string
#  holiday            :string
#  allowance          :string
#  allowance_contents :string
#  closing_on         :string
#  payment_on         :string
#  method_payment     :string
#  desuction          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  company_id         :integer
#

class Employment < ApplicationRecord
	belongs_to :company, optional: true
	belongs_to :user, optional: true
end
