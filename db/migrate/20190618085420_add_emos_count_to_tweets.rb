class AddEmosCountToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :emotions_count, :integer, null: false, default: 0
  end
end
