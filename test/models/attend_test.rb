# == Schema Information
#
# Table name: attends
#
#  id            :integer          not null, primary key
#  start_at      :datetime
#  end_at        :datetime
#  rest_start_at :datetime
#  rest_end_at   :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  worker_id     :integer
#

require 'test_helper'

class AttendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
