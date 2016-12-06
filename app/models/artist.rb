class Artist < ApplicationRecord
	has_many :albums, dependent: :destroy
	validates :name, presence: true

	def self.search(search)
	  if search
	    where('name LIKE :search OR genre LIKE :search OR start LIKE :search',search: "%#{search}%")
	  else
	    all
	  end
	end
end
