class Album < ApplicationRecord
  belongs_to :artist
  has_many :songs, dependent: :destroy
  validates :name, presence: true
  has_attached_file :artwork, styles: { medium: "300x300>", thumb: "150x150#"}, :default_url => "missing.png"
  validates_attachment_content_type :artwork, content_type: /\Aimage\/.*\Z/
end
