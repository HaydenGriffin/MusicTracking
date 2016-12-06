class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :destroy
  validates :name, presence: true
  validates :year, presence:true, :inclusion => 1900..2017
  has_attached_file :artwork, styles: { medium: "300x300>", thumb: "150x150#"}, :default_url => "missing.png"
  validates_attachment_content_type :artwork, content_type: /\Aimage\/.*\Z/

  def self.search(search)
	  if search
	    joins(:artist).where('albums.name LIKE :search OR albums.year LIKE :search OR artists.name LIKE :search',search: "%#{search}%")
	  else
	    all
	  end
	end
end
