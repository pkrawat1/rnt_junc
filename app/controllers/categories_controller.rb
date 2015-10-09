class CategoriesController < ApplicationController
  def index
    categories = Category.includes(:sub_categories)
    render json: {
      categories: categories.as_json(
        only: [:_id, :name, :desc, :logo],
        include: {
          sub_categories: {
            only: [:_id, :name, :logo]
          }
        }
      )
    }
  end
end
