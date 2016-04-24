class Api::ProductsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update]

  def show
    product = Product.find(params[:id])
    render json: product.as_json
  end

  def create
    product = Product.new(product_params)
    render json: {
      status: product.save, error: product.errors.messages,
      product_id: product.id.to_s }
  end

  def update
    product = Product.find(params[:id])
    product.attributes = product_params
    render json: {status: product.save, error: product.errors.messages}
  end

  def destroy
    product = Product.find(params[:id])
    status = product.destroy
  ensure
    render json: {status: status, error: 'Something went wrong'}
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :desc, :mft_date, :rent, :logo,
      :sub_category_id
      )
  end

end
