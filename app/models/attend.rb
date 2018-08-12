# == Schema Information
#
# Table name: attends
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  start_at      :datetime
#  end_at        :datetime
#  rest_start_at :datetime
#  rest_end_at   :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Attend < ApplicationRecord
  belongs_to :user

  scope :started, -> { where(end_at: nil).order(:start_at) }
end
