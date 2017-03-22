class AddTenantIdToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :tenant_id, :integer
  end
end
