class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :desc)
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    # データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save
    # 詳細画面へリダイレクト
    redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
