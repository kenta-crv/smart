class Attend < ApplicationRecord
  belongs_to :user

  scope :started, -> { where(end_at: nil).order(:start_at) }
end
