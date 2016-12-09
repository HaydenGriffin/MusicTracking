class Artist < ApplicationRecord
	has_many :albums, dependent: :destroy
	validates :name, presence: true
	validates :start, presence:true, :inclusion => {:in => 1900..2017, :message => I18n.t('error_year')}

	def self.search(search)
	  if search
	    where('name LIKE :search OR genre LIKE :search OR start LIKE :search',search: "%#{search}%")
	  else
	    all
	  end
	end
end
