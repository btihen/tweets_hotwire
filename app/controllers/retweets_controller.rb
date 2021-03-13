class RetweetsController < ApplicationController
  before_action :set_tweet

  def create
    @tweet.increment! :retweets

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@tweet) }
      format.html { redirect_to tweets_url, notice: "Tweet has been re-tweeted." }
      format.html { redirect_to tweets_url }
    end
  end

  def update
    @tweet.increment! :retweets

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@tweet) }
      format.html { redirect_to tweets_url, notice: "Tweet has been re-tweeted." }
      format.html { redirect_to tweets_url }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
