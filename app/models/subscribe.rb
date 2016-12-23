class Subscribe < ApplicationRecord
	belongs_to :user
	belongs_to :messages
end
