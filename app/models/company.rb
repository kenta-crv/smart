class Company < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :employments
    has_many :invoices
    has_many :infos
    has_many :workers
    has_many :pictures, dependent: :destroy
    
    
	validates :company, presence: true
	
end
