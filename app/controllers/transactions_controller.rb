class TransactionsController < ApplicationController
  before_action :set_product

  def index
    @transactions = @product.transactions
  end

  def new
    @transaction = @product.transactions.new(kind: params[:kind].to_i)
  end

  def create
    @transaction = @product.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        if @transaction.add?
          @product.update(quantity: (@product.quantity + @transaction.quantity))
        else
          @product.update(quantity: (@product.quantity - @transaction.quantity))
        end
        format.html { redirect_to product_transactions_path(@product), notice: 'La transacción se ha realizado con éxito.' }
      else
        format.html { render :new }
      end
    end
  end

private
  def transaction_params
    params[:transaction][:kind] = params[:transaction][:kind].to_i
    params.require(:transaction).permit!
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
