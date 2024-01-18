class Admin::GenresController < ApplicationController
  def create
    #データを受け取り新規登録するためのインスタンス作成
    genre = Genre.new(genre_params)
    #データをデータベースに保持するためのsaveメソッド実行
    genre.save
    #元のページにリダイレクト
    redirect_to request.referer
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def update
  end
  
  private
  def genre_params
    params.require(:Genre).permit(:name)
  end
end
