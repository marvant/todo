class Task < ApplicationRecord
	belongs_to :user

	validates :title, { presence: true }
	validates :deadline, { presence: true }
end
