class User < ActiveRecord::Base
  has_many :reviews
  has_many :products ,through: :reviews
 
  def favorite_product
    fav_review = reviews.order(star_rating: :desc).first
    fav_review&.product #this will help return nil if the user has no reviews
  end
  def remove_reviews(product)
    if product.is_a?(Product) && products.include?(product)
      reviews.where(product_id: product.id).destroy_all
    else
      pp "You have not reviewed this product."
    end
  end  
end

