class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :billboard, optional: true
  validates :title, presence: true
end
