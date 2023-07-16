class User < ActiveRecord::Base
  has_many :products ,through: :reviews
  has_many :reviews
  def favorite_product
    fav_review = reviews.order(star_rating: :desc).first
    fav_review&.product #this will help return nil if the user has no reviews
  end
  def remove_reviews(product)
    reviews=Review.where(product_id: product.id)
    reviews.destroy_all
  end
end

