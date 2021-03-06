class CategoriesController < ApplicationController
    
    before_action :set_category, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def edit

    end

    def create
      #render plain: params[:product].inspect
      @category = Category.new(category_params)

      if @category.save
          flash[:notice] = "Category was successfully created"
          redirect_to category_path(@category)
      else
          render 'new'
      end
    end

    def update
      if @category.update(category_params)
        flash[:notice] = "Category was successfully updated"
        redirect_to category_path(@category)
      else
        render 'edit'
      end
    end

    def show

    end

    def destroy
      @category.destroy
      flash[:notice] = "Category was successfully deleted"
      redirect_to categories_path
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :feature, :model, :avatar)
    end
end