class TweetsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tweet, except: [:index, :new, :create]

  def index
    @tweets = Tweet.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:prefecture_id, :city, :title, :description, :photo).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end