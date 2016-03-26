class Api::ProductsController < ApplicationController
  def show
    product = Product.find(params[:id])
    render json: product.as_json
  end

  def create
    product = Product.new(product_params)
    render json: {status: product.save, error: product.errors.messages}
  end

  def update
    product = Product.find(params[:id])
    product.attributes = product_params
    render json: {status: product.save, error: product.errors.full_message}
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :desc, :mft_date, :rent, :logo
      )
  end

end
