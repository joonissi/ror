module RatingAverage
  extend ActiveSupport::Concern

  def rating_average
    i = 0
    avg = 0.0

    ratings.each do |rating|
      puts rating.score
      i += 1
      avg += rating.score
    end
    avg = (avg / i).round(3)
    [i, avg]
  end
end
