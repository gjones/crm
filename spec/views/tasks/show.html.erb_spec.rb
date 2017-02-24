require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :title => "Title",
      :detail => "MyText",
      :author => "Author",
      :contact_id => 2,
      :completed => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
