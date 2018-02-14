class ItemsController < ApplicationController
  before_action :set_order

  def new
    @item = @order.items.new
  end

  def create
    @item = @order.items.new(item_params)
    product = @item.product

    respond_to do |format|
      if validate_product_quantity(product, @item.quantity) && @item.save
        @item.update(value: product.value, total: (product.value * @item.quantity))
        product.update(quantity: (product.quantity - @item.quantity))
        format.html { redirect_to order_items_path(@order), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @items = @order.items
  end

  def destroy
    @order.items.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to order_items_path(@order), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_order
    @order = Order.find params[:order_id]
  end

  def validate_product_quantity(product, quantity)
    product.quantity >= quantity
  end

  def item_params
    params.require(:item).permit(:product_id, :order_id, :quantity)
  end

end
