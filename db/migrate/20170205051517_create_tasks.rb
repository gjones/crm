class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :title
      t.text :detail
      t.string :author
      t.datetime :start_date
      t.integer :contact_id
      t.boolean :completed

      t.timestamps
    end
    add_reference :tasks, :company, foreign_key: true, type: :uuid
  end
end
