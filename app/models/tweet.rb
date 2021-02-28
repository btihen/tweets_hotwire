class Tweet < ApplicationRecord
  validates :body, presence: true

  # broadcast "tweets" send all changes to the `turbo_stream` view "tweets"
  # `broadcast_prepend_to` places new information at the top instead of appending to the bottom
  after_create_commit { broadcast_prepend_to "tweets" }
end
