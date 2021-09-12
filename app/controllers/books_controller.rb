class BooksController < ApplicationController
  def index
    @books = Book.all.order(created_at: :desc)
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
    # データをデータベースに保存するためのsaveメソッド実行
    if @book.save
      # 詳細画面へリダイレクト
      redirect_to book_path(@book),flash: { notice: 'Book was successfully created.' }
    else
      @books = Book.all.order(created_at: :desc)
      render action: :index

    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    	redirect_to book_path(@book),flash: { notice: 'Book was successfully updated.' }
    else
    	render action: :edit

    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
