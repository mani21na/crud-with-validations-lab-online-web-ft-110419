class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :year,
    message: "should happen once per year" }
  validates :released, inclusion: { in: %w[true false] }
  validates :release_year, presence: true, unless: -> { released.value == false }, release_year_cannot_be_in_the_past:
  validates :artist_name, presence: true

  def release_year_cannot_be_in_the_past
    if release_year > Date.current.year
      errors.add(:release_year, "can't be in the past")
    end
  end
end
