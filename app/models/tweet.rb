class Tweet < ApplicationRecord
  validates :body, presence: true

  # broadcast "tweets" send all changes to the `turbo_stream` view "tweets"
  # `broadcast_prepend_to` places new information at the top instead of appending to the bottom
  after_create_commit { broadcast_prepend_to "tweets" }
  after_destroy_commit { broadcast_remove_to "tweets" }
  after_update_commit { broadcast_replace_to "tweets" }
end
