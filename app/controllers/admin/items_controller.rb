class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all.page(params[:page]).per(10)
    @genres = Genre.all
    # byebug
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    # byebug
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      redirect_to request.referer
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active, :genre_id, :genre_name)
  end
end
