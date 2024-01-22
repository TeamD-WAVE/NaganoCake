class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
    # byebug
    if params[:genre_id].present?
      #presentメソッドでparams[:genre_id]に値が含まれているか確認 => trueの場合下記を実行
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
      # byebug
    end
  end

  def show
  end
end
