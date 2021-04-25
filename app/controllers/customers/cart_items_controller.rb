class Customers::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
    @cart_items.each do |cart_item|
      @total_price += cart_item.product.price.to_i * cart_item.quantity.to_i * 1.1
      #binding.pry
    end
    #@total_price = @cart_items.sum{|cart_item|cart_item.product.price * cart_item.quantity * 1.1}
    # 1行目の@cart_itemsにsumメソッドを用いて{}の||ブロック変数にcart_itemを代入している。(each do || end の文章と同じイメージ)
    # 『このcart_itemのproductのprice』 → 『このカート商品の商品（単体）の税抜き価格』
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.product_id = params[:cart_item][:product_id]
    if @cart_item.save
     flash[:notice] = "#{@cart_item.product.name}をカートに追加しました。"
     redirect_to cart_items_path
    else
      @product = Product.find(params[:cart_item][:product_id])
      flash[:alert] = "個数を選択してください"
      render "customers/products/show"
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash.now[:alert] = "#{@cart_item.product.name}を削除しました"
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:quantity, :product_id, :customer_id)
    end


end
