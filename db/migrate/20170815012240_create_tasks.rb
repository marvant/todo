class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.date :deadline
      t.text :detail
      t.boolean :completed

      t.timestamps
    end
  end
end
