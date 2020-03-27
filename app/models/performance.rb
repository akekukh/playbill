class Performance < ApplicationRecord
  validates :name, :duration, presence: true
  validate :durations_cannot_overlap

  def durations_cannot_overlap
    if Performance.where("duration && daterange(?, ?)", duration.first, duration.last).present?
      errors.add(:duration, 'cannot intersect')
    end
  end

end
