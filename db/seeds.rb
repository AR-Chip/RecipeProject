# Require Statements
require 'net/http'
require 'json'
require 'pp'

# Clean all DB
Recipe.destroy_all
Category.destroy_all
Ingredient.destroy_all


# Open Recipe Dataset
recipeFile = Rails.root.join('db/AllRecipes Ingredients Fixed.csv')
puts "Loading Recipes from the CSV file: #{recipeFile}"
csv_data = File.read(recipeFile)
recipes = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

# url = 'https://dog.ceo/api/breeds/list/all'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# dog_breeds = JSON.parse(response)

# puts dog_breeds



# movies.each do |m|
#   production_company = ProductionCompany.find_or_create_by(name: m['production_company'])

#   if production_company && production_company.valid?
#     # create the movie
#     movie = production_company.movies.create(
#       title: m['original_title'],
#       year: m['year'],
#       duration: m['duration'],
#       description: m['description'],
#       average_vote: m['avg_vote']
#     )
#     puts "Invalid movie #{m['original_title']}" unless movie&.valid?
#     genres = m['genre'].split(',').map(&:strip)

#     genres.each do |genre_name|
#       genre = Genre.find_or_create_by(name: genre_name)
#       MovieGenre.create(movie:, genre:)
#     end

#   else
#     puts "invalid production company #{m['production_company']} for movie #{m['original_title']}"
#   end
#   puts m['original_title']
# end

# puts "Created #{ProductionCompany.count} Production Companies"
# puts "Created #{Movie.count} Movies."
# puts "Created #{Genre.count} Genres"
# puts "Created #{MovieGenre.count} Movie Genres"

# Page.create(
#   title: 'About The Data',
#   content: 'The data powering this website was provied by IMDB Kaggle dataset.',
#   permalink: 'about_the_data'
# )