class AddTodo < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.integer :priority, null: false
      t.datetime :completed_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
