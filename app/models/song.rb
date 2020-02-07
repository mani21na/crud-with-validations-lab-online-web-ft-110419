class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :year }
  validates :released, inclusion: { in: %w[true false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, unless: -> { released.value == false }
  validate release_year_cannot_be_in_the_past:


  def release_year_cannot_be_in_the_past
    if release_year > Date.current.year
      errors.add(:release_year, "can't be in the past")
    end
  end
end
