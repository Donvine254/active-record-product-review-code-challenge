class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  def print_review
    if product && product.name && user && user.name
      pp "Review for #{product.name} by #{user.name}: #{star_rating}. #{comment}"
    else
      pp "Incomplete review"
    end
  end
  
end


