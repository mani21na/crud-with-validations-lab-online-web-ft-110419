class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: %w[true false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, unless: -> { :released == false }
  validates_with ReleaseYearValidator
end
