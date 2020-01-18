class ProductsController < ApplicationController
  
  def index
  @products = Product.all 
end
    
    def create
    @category = Category.find(params[:category_id])
    @product = @category.products.create(product_params)
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
      params.require(:product).permit(:name, :description, :price, :make)
    end
end
