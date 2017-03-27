require 'rails_helper'

RSpec.describe "tenants/edit", type: :view do
  before(:each) do
    @tenant = assign(:tenant, Tenant.create!(
      :name => "MyString",
      :subdomain => "MyString"
    ))
  end

  it "renders the edit tenant form" do
    render

    assert_select "form[action=?][method=?]", tenant_path(@tenant), "post" do

      assert_select "input#tenant_name[name=?]", "tenant[name]"

      assert_select "input#tenant_subdomain[name=?]", "tenant[subdomain]"
    end
  end
end
