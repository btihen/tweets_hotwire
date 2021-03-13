class LikesController < ApplicationController
  before_action :set_tweet

  def create
    @tweet.increment! :likes

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@tweet) }
      format.html { redirect_to tweets_url, notice: "Tweet was liked." }
      format.json { render :show, status: :created, location: @tweet }
    end
  end

  def update
    @tweet.increment! :likes

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@tweet) }
      format.html { redirect_to tweets_url, notice: "Tweet was liked." }
      format.json { render :show, status: :created, location: @tweet }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
