class Admins::ProductsController < ApplicationController
  
  PER = 10
  def index
    @products = Product.page(params[:page]).per(PER)
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_product_path(@product), notice: '＊商品を登録しました＊'
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_product_path(@product), notice: '＊商品情報を更新しました＊'
    else
      render 'edit'
    end
  end
  
  private
  
  def product_params
    params.require(:product).permit(:image, :name, :detail, :category_id, :price, :product_status)
  end
  
end
