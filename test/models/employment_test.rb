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

require 'test_helper'

class EmploymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
