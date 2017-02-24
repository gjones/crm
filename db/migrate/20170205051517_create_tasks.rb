class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :detail
      t.string :author
      t.integer :contact_id
      t.boolean :completed

      t.timestamps
    end
  end
end
