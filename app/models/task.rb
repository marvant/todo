class Task < ApplicationRecord
	belongs_to :user

	validates :title, { presence: true }
	validates :deadline, { presence: true }

	validates_length_of :title, :maximum => 255
end
