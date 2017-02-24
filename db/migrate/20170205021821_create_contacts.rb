class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :surname
      t.date :birthday
      t.string :website
      t.string :primary_phone
      t.string :email
      t.text :bio
      t.string :address_street
      t.string :address_street2
      t.string :address_city
      t.string :address_state
      t.string :address_postcode
      t.string :address_country
      t.string :referred_by
      t.string :twitter
      t.string :linkedin
      t.string :facebook
      t.float  :latitude
      t.float  :longitude
      t.string :string
      t.string :slug
      t.string :company
      t.string :job_title
      t.string :work_phone
      t.string :work_email
      t.string :work_address_street
      t.string :work_address_street2
      t.string :work_address_city
      t.string :work_address_state
      t.string :work_address_postcode
      t.string :work_address_country

      t.timestamps
    end

    add_index :contacts, :slug, unique: true
  end

end
