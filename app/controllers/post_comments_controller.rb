class PostCommentsController < ApplicationController
  
  def show
    @post_comments = PostComment.all
    @post_comment = PostComment.new
  end
  
  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    
    @book_detail = Book.find(params[:book_id])
    @post_comments = PostComment.all
    @post_comment = PostComment.new(post_comment_params)
    respond_to do |format|
     if comment.save
      format.html{redirect_to @post_comment}
      format.js
     else
       format.html {render "books/show" }
       format.js {render :errors}
     end
   end
  end
  
  def destroy
    PostComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
