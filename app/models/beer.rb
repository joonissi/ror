class Beer < ApplicationRecord
  include RatingAverage
  
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

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

  def to_s
    self.name + " " + self.brewery.name
  end
end
