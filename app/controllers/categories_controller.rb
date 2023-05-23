class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
      @categories = Category.all
    end
  
    def show
    end
  
    def new
      @category = Category.new
    end
  
    def edit
    end
  
    def create
      @category = Category.new(category_params)
  
      respond_to do |format|
        if @category.save
          format.html { redirect_to category_url(@category), notice: "Categoria creada" }
          format.json { render :show, status: :created, location: @category }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to category_url(@category), notice: "Categoria actualizada" }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @category.destroy
  
      respond_to do |format|
        format.html { redirect_to categories_url, notice: "Categoria eliminada" }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def category_params
        params.require(:category).permit(:title, :is_income)
      end
end
