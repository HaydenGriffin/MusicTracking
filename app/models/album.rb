class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :destroy # Deletes dependencies - any songs within the album will also be removed on deletion
  validates :name, presence: true
  validates :year, presence:true, :inclusion => {:in => 1900..2017, :message => I18n.t('error_year')} # Regex validation with custom error message
  has_attached_file :artwork, styles: { medium: "300x300>", thumb: "150x150#"}, :default_url => "missing.png" # Allows a file to be attached with an album, which is artwork. Saves two copies: a medium image and a thumbnail image
  validates_attachment_content_type :artwork, content_type: /\Aimage\/.*\Z/ # Validation ensures an image is submitted

  # Custom search for the albums view (index.html.haml) that allows a user to search an album name, an album year or an artist name
  def self.search(search)
	  if search
	    joins(:artist).where('albums.name LIKE :search OR albums.year LIKE :search OR artists.name LIKE :search',search: "%#{search}%")
	  else
	    all
	  end
	end
end
