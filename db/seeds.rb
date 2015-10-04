# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# [
#  [category, desc, [subcategories]]
#]
_categories = YAML.load_file("#{Rails.root}/config/categories.yml")

_categories.each do |arr|
  new_category = Category.find_or_create_by(name: arr[0], desc: arr[1])
  arr[2].each{|name| new_category.sub_categories.find_or_create_by(name: name)}
end