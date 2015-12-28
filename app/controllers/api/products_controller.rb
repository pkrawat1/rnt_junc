class Api::ProductsController < ApplicationController
  def show
    product = Product.find(params[:id])
    render json: product.as_json
  end
end
