class Duck < ApplicationRecord
	belongs_to :student

	validates :name, presence: true
	validates :description, presence: true
end
