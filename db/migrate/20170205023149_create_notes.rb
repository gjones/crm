class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.integer :contact_id
      t.text :body
      t.string :author

      t.timestamps
    end
    add_reference :notes, :company, foreign_key: true, type: :uuid
  end
end
