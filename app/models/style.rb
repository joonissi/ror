class Style < ApplicationRecord
  include RatingAverage

  has_many :beers

  def self.top(n)
    sorted_by_rating_in_desc_order = Style.all.each do |style|
      b = style.ratings.sort_by{ |b| -(b.rating_average || 0) }
      a.insert(b)
      # rikki
    end

    sorted_by_rating_in_desc_order[0..n]
  end
end
