class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :subdomain
      t.string :address_street
      t.string :address_street2
      t.string :address_city
      t.string :address_state
      t.string :address_postcode
      t.string :address_country
      t.string :twitter
      t.string :linkedin
      t.string :facebook
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
