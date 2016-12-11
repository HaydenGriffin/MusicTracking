class Artist < ApplicationRecord
	has_many :albums, dependent: :destroy # Deletes dependencies - any albums created by the artist will also be removed on deletion
	validates :name, presence: true
	validates :start, presence:true, :inclusion => {:in => 1900..2017, :message => I18n.t('error_year')} # Regex validation with custom error message

	# Custom search for the artists view (index.html.haml) that allows a user to search a name, genre or start year
	def self.search(search)
	  if search
	    where('name LIKE :search OR genre LIKE :search OR start LIKE :search',search: "%#{search}%")
	  else
	    all
	  end
	end
end
