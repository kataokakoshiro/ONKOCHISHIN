class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
    @favorite_tweets = @user.favorite_tweets
    @good_tweets = @user.good_tweets
    @bad_tweets = @user.bad_tweets
  end

  def top
  end  
end
