class Public::UserBooksController < ApplicationController
  before_action :set_user

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      @author = Author.new(deliverable_type: "Book", deliverable_id: @book.id, user_id: @user.id)
      @author.save
      flash[:info] = "論文を新規登録しました！"
      redirect_to public_user_user_books_path(@user.login_id)
    else
      set_user
      render "new"
    end

  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:info] = "論文を編集しました！"
      redirect_to public_user_user_books_path(@user.login_id)
    else
      set_user
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])

    if @book.destroy
      flash[:info] = "論文を削除しました！"
      redirect_to public_user_user_books_path(@user.login_id)
    else
      flash[:danger] = "エラーです。"
      render "index"
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :abstract, :figure, :linkpath)
  end
end
