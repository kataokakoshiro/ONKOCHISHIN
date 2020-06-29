class GoodsController < ApplicationController
  def create
    good = current_user.goods.build(tweet_id: params[:tweet_id])
    good.save
    redirect_to tweets_path

    if @bad= Bad.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
      @bad.destroy
    end
    if @favorite= Favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
      @favorite.destroy
    end


  end

  def destroy
    good = Good.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    good.destroy
    redirect_to tweets_path
  end
end
