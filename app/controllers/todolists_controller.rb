class TodolistsController < ApplicationController
  
  # /todolists/new
  def new
  # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @list = List.new
  end
  
  # /todolists/
  def create
    # １. データを新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      render :new
    end
  end
  
  def index
    @lists = List.all
  end
  
  # 終 /todolists/
  
  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  
   def destroy
     list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to todolists_path  # 投稿一覧画面へリダイレクト
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  
end
