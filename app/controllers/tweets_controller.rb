class TweetsController < ApplicationController
  
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    if params[:back]
      @tweet=Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  
  def create
    @tweet = Tweet.new(tweets_params)
    Tweet.create(tweets_params)
    if @tweet.save
    redirect_to tweets_path, notice: "つぶやきました！"
    else
    render 'new'
    end
  end
  
  def edit
        @tweet = Tweet.find(params[:id])
  end
  
  def update
    set_tweet
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice: "編集しました！"
  end
  
  def destroy
    set_tweet
    @tweet.destroy
    redirect_to tweets_path, notice: "つぶやきを消しました！"
  end
  

private
  def tweets_params
    params.require(:tweet).permit(:tweet)
  end

  def set_tweet
        @tweet = Tweet.find(params[:id])
  end
  
end
