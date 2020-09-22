class Pet < ApplicationRecord
	SPECIES = %w[cat dog rabbit snake turtle].freeze
	# dog, cat, rabbit, snake or turtle.
	validates :name, presence: true
	validates :species, inclusion: { in: SPECIES }

	def found_days_ago
		today = Time.zone.today
		(today - found_on_date).to_i
	end
end
