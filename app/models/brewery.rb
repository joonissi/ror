class Brewery < ApplicationRecord
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1940,
                                    less_than_or_equal_to: 2018,
                                    only_integer: true }

  # def average_rating
  #   i = 0
  #   avg = 0.0

  #   self.ratings.each do |rating|
  #     puts rating.score
  #     i = i + 1
  #     avg = avg + rating.score
  #   end
  #   avg = (avg / i).round(3)
  #   return [i,avg]
  # end
end
