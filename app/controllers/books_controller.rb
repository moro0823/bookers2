class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    @book.user_id = current_user.id
  end
  
  def create
    @books = Book.all
    @user = current_user
    @book = Book.new(book_params)
    #Book.newで入力されたデータがbook_paramsに格納され、@bookとして置き換える
    @book.user_id = current_user.id
    # bookモデルにuser_idの情報を置き換える(現在のuser_id)
    if @book.save
     redirect_to book_path(@book.id)
     flash[:notice] = "Book was successfully created"
    else
     render:index
    end
  end
  
  def show
    @user = current_user
    @book = Book.new
    @book.user_id = current_user
    @bookid = Book.find(params[:id]) 
    # @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     redirect_to book_path(book.id)
    else
     render:edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
   def book_params
     params.require(:book).permit(:title, :body)
    # book_paramsの中に新規投稿フォームで入力されたデータが格納される
   end
   
    def user_params
     params.require(:user).permit(:name, :profile_image,:introduction)
    end
   
end
