class Customer < ApplicationRecord
	validates :name,  {uniqueness: true, presence: true} #同じメアドと空を防ぐ
	validates :email,  {uniqueness: true, presence: true} #同じメアドと空を防ぐ
end
