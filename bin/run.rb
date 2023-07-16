require_relative '../config/environment'
require 'sinatra/activerecord/rake'
# Review
system('rake db:seed') 
pp "Review#user:"
pp Review.first.user.inspect

pp "Review#product:"
pp Review.first.product

# Product
pp "Product#reviews:"
pp Product.first.reviews

pp "Product#users:"
pp Product.first.users

# User
pp "User#reviews:"
pp User.first.reviews

pp "User#products:"
pp User.first.products

# Verify the aggregate and association methods

# Review
pp "Review#print_review:"
Review.first.print_review

# Product
stapler = Product.first
pp "Product#print_all_reviews:"
stapler.print_all_reviews

pp "Product#leave_review:"
stapler.leave_review(User.first, 4, "Great product!")

pp "Product#average_rating:"
pp stapler.average_rating

# User
pp "User#favorite_product:"
pp User.first.favorite_product

pp "User#remove_reviews:"
User.first.remove_reviews(stapler)
