class Song < ApplicationRecord
  belongs_to :album
  validates :name, presence: true
  validates_format_of :length, with: /\A([0-5]?[0-9]):([0-5]?[0-9])\z/, on: :create, :message => I18n.t('error_length')

	def self.search(search)
	  if search
	    joins(:album).where('songs.name LIKE :search OR albums.name LIKE :search',search: "%#{search}%")
	  else
	    all
	  end
	end
end
