class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    # データを新規登録するためのインスタンス作成
    book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    book.save
    # index画面へリダイレクト
     redirect_to '/books/:id'
    # book_path(blog.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private
  # ストロングパラメータ
  def book_params
    params.permit(:title, :body)
  end


end
