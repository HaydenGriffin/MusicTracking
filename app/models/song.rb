class Song < ApplicationRecord
  belongs_to :album
  validates :name, presence: true
  validates :track, uniqueness: true
end
