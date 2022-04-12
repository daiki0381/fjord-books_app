class ChangeFriendsToFollows < ActiveRecord::Migration[6.1]
  def change
    rename_table :friends, :follows
  end
end
