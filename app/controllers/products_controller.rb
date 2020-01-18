class ProductsController < ApplicationController
  
    def index
    @products = Product.all
    end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.category_id = @category.id

    unless @product.save
      flash[:alert] = @product.errors.full_messages
    end

     redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to category_path(@category)
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :make, :picture)
    end
end

