class Public::SearchesController < ApplicationController
  def genre_search
    @genre_id = Genre.find(params[:id])
    @items = Item.where(genre_id: @genre_id).page(params[:page]).per(10)
    #ビュー（ジャンル検索部分）から送られてきたgenre_id`を持つ Itemを全て取得
  end
end
