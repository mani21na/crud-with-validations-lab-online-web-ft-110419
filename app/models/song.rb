class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: { scope: year }
  validates :released, inclusion: { in: %w[true false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, unless: -> { released.value == false }
  validates_with ReleaseYearValidator
end
