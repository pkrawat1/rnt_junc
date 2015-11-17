class Api::CategoriesController < ApplicationController
  before_action :set_current_user

  def index
    categories = Category.includes(:sub_categories)
    render json: categories.as_json(include: :sub_categories)
  end

  def products
    sub_category = SubCategory.find(params[:sub_category_id])
    products = sub_category.products
    render json: products.as_json
  end
end
