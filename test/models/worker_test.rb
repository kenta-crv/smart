# == Schema Information
#
# Table name: workers
#
#  id             :integer          not null, primary key
#  first_name     :string
#  last_name      :string
#  tel            :string
#  e_mail         :string
#  post_number    :string
#  address        :string
#  birthday       :string
#  classification :string
#  authority      :string
#  hire_date      :string
#  departure_date :string
#  affiliation    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
