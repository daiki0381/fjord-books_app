class AddIndexFollowsFollowerId < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, :follower_id
  end
end
