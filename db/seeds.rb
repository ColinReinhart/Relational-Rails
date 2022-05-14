# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Run.destroy_all
Resort.destroy_all

@telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
@spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
@bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 2125)
@breckenridge = Resort.create!(name: "Breckenridge", location: "Colorado", is_open: true,  base_elevation: 9600, summit_elevation: 12998)
@silverthorne = @breckenridge.runs.create!(name: "Silverthorne", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Green", vertical_feet: 632)
