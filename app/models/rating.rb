class Rating < ApplicationRecord
  include RatingAverage

  belongs_to :beer
  belongs_to :user

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

  scope :recent, -> { order(created_at: :desc).limit(5) }

  def self.top(n)
    sorted_by_rating_in_desc_order = Rating.all.sort_by{ |b| -(b.rating_average[1] || 0) }
    sorted_by_rating_in_desc_order[0..n]
  end

  def to_s
    beer.name + " " + score.to_s
  end
end
