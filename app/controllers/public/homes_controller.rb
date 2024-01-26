class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:about]

  def top
    @genres = Genre.where(valid_invalid_status: 0) # ジャンルの有効無効ステータスが有効のものだけ探す/除外検索
    @items = Item.limit(8).offset(4) # 先頭から5つのレコードから８つを取得
    render 'public/homes/top'
  end

  def about
    # アクションの中身
  end


end