class TweetsController < ApplicationController
  before_action :authenticate_user!
  def new
    @tweet = Tweet.new
   
  end

  def index
    @tweets = Tweet.all
    @q = Tweet.ransack(params[:q])
    @tweets = params[:tag_id].present? ? Tag.find(params[:tag_id]).tweets : Tweet.all
    @tweets = @q.result(distinct: true)||tag
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
    @comments = @tweet.comments
    @comment = @tweet.comments.build
  end

  def create
    @tweet = Tweet.new(tweet_params)  # フォームから送られてきたデータ(body)をストロングパラメータを経由して@tweetに代入
    @tweet.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    @tweet.save
    redirect_to tweets_path
    
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to :action => "show", :id => @tweet.id
    else
      redirect_to :action => "new"
    end
  end  

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to action: :index
  end

  def top
  end  

  def tag
    params[:tag_id].present? ? Tag.find(params[:tag_id]).tweets : Tweet.all

  end  

  private
  def tweet_params
    params.require(:tweet).permit(:body,:country,:image,tag_ids: []) # tweetモデルのカラムのみを許可
  end

  
  
end
