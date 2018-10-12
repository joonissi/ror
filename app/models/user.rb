class User < ApplicationRecord
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true,
                       length: { minimum: 3, maximum: 30 }
  validates :password, length: { minimum: 4 }
  validates_with UpperValidator
  validates_with NumberValidator

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

  def self.top(n)
    sorted_by_rating_in_desc_order = User.all.sort_by{ |b| -(b.ratings.count || 0) }
    sorted_by_rating_in_desc_order[0..n]
  end

  def favorite_beer
    return nil if ratings.empty?

    ratings.order(score: :desc).limit(1).first.beer
  end

  def favorite_style
    return nil if ratings.empty?

    ratings.order(score: :desc).limit(1).first.beer.style
  end

  def favorite_brewery
    return nil if ratings.empty?

    ratings.order(score: :desc).limit(1).first.beer.brewery.name
  end

end

