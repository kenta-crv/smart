class Employment < ApplicationRecord
	belongs_to :company, optional: true
	belongs_to :user, optional: true
end
