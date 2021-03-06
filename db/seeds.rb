# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by(
  email: 'pankajrawat19sept@gmail.com',
  password: 'admin_for_rntjunc',
  full_name: 'Pankaj Rawat',
  mobile: '8793606955',
  admin: true,
  role: Role.find_or_create_by(
    name: :superadmin
  )
)

# [
#  [category, desc, [subcategories]]
#]
categories = YAML.load_file("#{Rails.root}/config/categories.yml")
products = YAML.load_file("#{Rails.root}/config/products.yml")

categories.each do |arr|
  new_category = Category.find_or_create_by(name: arr[0], desc: arr[1])
  arr[2].each do |name|
    sub_category = new_category.sub_categories.find_or_create_by(name: name)
    (products[sub_category.name] || []).each do |product|
      sub_category.products.find_or_create_by(product)
    end
  end
end