require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :title => "MyString",
      :detail => "MyText",
      :author => "MyString",
      :contact_id => 1,
      :completed => false
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_detail[name=?]", "task[detail]"

      assert_select "input#task_author[name=?]", "task[author]"

      assert_select "input#task_contact_id[name=?]", "task[contact_id]"

      assert_select "input#task_completed[name=?]", "task[completed]"
    end
  end
end
