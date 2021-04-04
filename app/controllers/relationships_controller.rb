class RelationshipsController < ApplicationController
 def follow
  current_user.follow(params[:id])
  redirect_back(fallback_location: root_path)
 end

 def unfollow
  current_user.unfollow(params[:id])
  redirect_back(fallback_location: root_path)
 end

 def index
   @user = current_user
 end

 private
 def user_params
  params.require(:user).permit(:name, :profile_image,:introduction)
 end

end
