class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    item = Item.find_by(id: params[:id])
    item.update(item_params)
    redirect_to item_path(item)
  end

  def new
    @item = Item.new
  end

  def create
    item = current_user.items.create(item_params)
    redirect_to item_path(item)
  end

  def destroy
    item = Item.find_by(id: params[:id])
    item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :link, :price, :rating, :image, wishlist_ids: [])
  end
end
