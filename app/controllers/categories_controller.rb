class CategoriesController < ApplicationController
  def index
    categories = Category.includes(:sub_categories)
    render json: {
      categories: categories.as_json(
        only: [:name, :desc, :logo],
        include: {
          sub_categories: {
            only: :name
          }
        }
      )
    }
  end
end
