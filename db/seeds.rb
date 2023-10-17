# Require Statements
require 'csv'
require 'net/http'
require 'json'
require 'pp'
require 'faker'

# Clean all DB
Recipe.destroy_all
Category.destroy_all
Ingredient.destroy_all
IngredientRecipe.destroy_all


# Open Recipe Dataset from both FAKER and CSV Dataset
recipeFile = Rails.root.join('db/AllRecipes Ingredients Images FIXED.csv')
puts "Loading Recipes from the CSV file: #{recipeFile}."
csv_data = File.read(recipeFile)
recipes = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

recipes.each do |r|
  dish = Recipe.create(name: r['Recipe Name'].titleize, instructions: r['instructions'], calories: Faker::Number.between(from: 100, to: 1200), image: r['image'], description: r['descriptor'])

  ethnicity = Category.find_or_create_by(name: "#{r['ethnicity'].titleize}")
  category = Category.find_or_create_by(name: "#{r['category'].titleize}")

  ethnicity.recipes << dish
  category.recipes << dish

  r['ingredients'].split(',').each do |i|
    stripped_ingredient = i.strip.titleize
    ingredient = Ingredient.find_or_create_by(name: stripped_ingredient)
    # ingredient_recipe = IngredientRecipe.create(ingredient: ingredient, recipe: dish, count: Faker::Number.between(from: 1, to: 10))
    # ingredient.recipe << dish

    if ingredient.valid?
      IngredientRecipe.create(ingredient: ingredient, recipe: dish, count: Faker::Number.between(from: 1, to: 10))
    else
      puts "Skipping invalid ingredient: #{stripped_ingredient.inspect}"
    end
  end
end

puts "Loading Recipes from the CSV file: #{recipeFile} is finished."



# url = 'https://dog.ceo/api/breeds/list/all'
# uri = URI(url)
# response = Net::HTTP.get(uri)
# dog_breeds = JSON.parse(response)vegetable oil beef flank steak beef broth can tomato sauce can tomato paste green bell pepper

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