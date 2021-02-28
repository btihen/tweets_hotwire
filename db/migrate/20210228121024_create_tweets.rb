class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :body, null: false
      t.integer :likes, null: false, default: 0
      t.integer :retweets, null: false, default: 0

      t.timestamps
    end
  end
end
