class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user, star_rating, comment)
    raise ArgumentError, 'User must be an instance of User class' unless user.is_a?(User)

    Review.create(star_rating: star_rating, comment: comment, product_id: id, user_id: user.id)
  end

  def print_all_reviews
    if reviews.empty?
        pp "no reviews available for #{name}"
    end
    reviews.map do |review|
      pp "Review for #{name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
    end
  end

  def average_rating
    if reviews.empty?
        pp "this product has not been reviewed yet"
    end
    reviews.average(:star_rating).to_f
  end
end


