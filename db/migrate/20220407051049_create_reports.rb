class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :body
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
