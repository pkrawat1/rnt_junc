class CategoriesController < ApplicationController
  def index
    categories = Category.includes(:sub_categories)
    render json: {
      categories: categories.as_json
    }
  end
end
