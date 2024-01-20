class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    # byebug
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # byebug
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_name)
  end
end
