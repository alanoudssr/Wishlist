class WishlistsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @wishlists = Wishlist.all
  end

  def show
    @wishlist = Wishlist.find_by(id: params[:id])
  end

  def edit
    @wishlist = Wishlist.find_by(id: params[:id])
  end

  def update
    wishlist = Wishlist.find_by(id: params[:id])
    wishlist.update(wishlist_params)
    redirect_to wishlist_path(wishlist)
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    wishlist = current_user.wishlists.create(wishlist_params)
    redirect_to wishlist_path(wishlist)
  end

  def destroy
    wishlist = Wishlist.find_by(id: params[:id])
    wishlist.destroy
    redirect_to wishlists_path
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:name, :description)
  end
end
