class BadsController < ApplicationController
  def create
    bad = current_user.bads.build(tweet_id: params[:tweet_id])
    bad.save
    redirect_to tweets_path

    if @good= Good.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
      @good.destroy
    end
    if @favorite= Favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
      @favorite.destroy
    end
  end

  def destroy
    bad = Bad.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    bad.destroy
    redirect_to tweets_path
  end
end
