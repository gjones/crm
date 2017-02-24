class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer :contact_id
      t.text :body
      t.string :author

      t.timestamps
    end
  end
end
