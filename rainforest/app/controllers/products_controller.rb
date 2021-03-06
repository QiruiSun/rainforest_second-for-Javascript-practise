class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :destroy, :edit, :update]

  def index
    @products = if params[:search]
      Product.where('LOWER(name) LIKE ?', "%#{params[:search]}%")
    else
      Product.all
    end

    @products = @products.order('created_at DESC').page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    if current_user
      @review = @product.reviews.build
    end


  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: "New Stuff Added!"
    else
      flash[:alert] = "Invalid input!"
      render :new
    end

  end

  def new
    @product = Product.new

  end

  def edit
    #code
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end

  end
  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def find_product
    @product = Product.find(params[:id])#code
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cent, :url)
  end

end
