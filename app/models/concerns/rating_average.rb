module RatingAverage
  extend ActiveSupport::Concern

  def rating_average
  #   i = 0
  #   avg = 0.0

  #   ratings.each do |rating|
  #     if rating.score.nil?
  #       #puts "here"
  #       rating.score = 0
  #     end
  #     i += 1
  #     avg += rating.score
  #   end
  #   avg = (avg / i).round(3)
  #   [i, avg]
  # end
    return 0 if ratings.empty?

    # keskiarvo on mahdollista laskea myös suoraan ActiveRecordilla
    # ratings.average(:score)
    ratings.reduce(0.0){ |sum, r| sum + r.score } / ratings.count
  end
end
