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

class Attend < ApplicationRecord
  belongs_to :worker

  scope :started, -> { where(end_at: nil).order(:start_at) }
  scope :day_attend, -> d {where(start_at: d..d+1)}
  scope :month_attends, -> d {where(start_at: d.beginning_of_month..d.end_of_month+1)}

  def start
    start_at.strftime("%H:%M:%S") if start_at.present?
  end

  def end
    end_at.strftime("%H:%M:%S") if end_at.present?
  end

  def working_time
    return 0 if start_at.blank? || end_at.blank?
    rest_time = (rest_start_at.blank? || rest_end_at.blank?) ? 0 : rest_end_at - rest_start_at
    return (end_at - start_at) -rest_time
  end

end
