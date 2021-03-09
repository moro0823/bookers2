class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
  end


  def show
    @user = User.find(params[:id])
    @books = Book.all
    @books = @user.books
    @book = Book.new
    @book.user_id = current_user.id
  end

  def index
   @users = User.all
   @user = current_user
   @book = Book.new
   @book.user_id = current_user.id
  end


  def edit
   @user = User.find(params[:id])
   if @user == current_user
    render "edit"
   else
   redirect_to user_path(current_user)
   end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user.id)
     flash[:notice] = "User was successfully update"
    else
     render:edit
    end
  end




  private
   def book_params
    params.require(:book).permit(:title, :body)
    book_paramsの中に新規投稿フォームで入力されたデータが格納される
   end

    def user_params
     params.require(:user).permit(:name, :profile_image,:introduction)
    end

end