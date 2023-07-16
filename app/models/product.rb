class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user, star_rating, comment)
    raise ArgumentError, 'User must be an instance of User class' unless user.is_a?(User)

    Review.create(star_rating: star_rating, comment: comment, product_id: id, user_id: user.id)
  end

  def print_all_reviews
    reviews.map do |review|
      puts "Review for #{name} by #{review.user.name}: #{review.star_rating}. #{review.comment}"
    end
  end

  def average_rating
    reviews.average(:star_rating).to_f
  end
end


