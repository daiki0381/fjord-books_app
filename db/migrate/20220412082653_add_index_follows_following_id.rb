class AddIndexFollowsFollowingId < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, [:following_id, :follower_id], unique: true
  end
end
