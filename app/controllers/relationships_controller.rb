class RelationshipsController < ApplicationController

  def create
    other_user = User.find(params[:followed_id])
   
    current_user.follow(other_user)
    @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: other_user.id)
    @relationship.create_activity(user: current_user)
    redirect_to user_url(other_user)
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    other_user = User.find(@relationship.followed_id)
    @relationship.destroy

    redirect_to user_url(other_user)
  end

end
