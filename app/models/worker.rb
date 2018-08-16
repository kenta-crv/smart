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
#  status_cd      :integer          default(0)
#  company_id     :integer
#

class Worker < ApplicationRecord
  as_enum :status, attendance: 1, un_attendance: 0, rest:2
  has_many :attends

end
