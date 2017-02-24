require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :title => "MyString",
      :detail => "MyText",
      :author => "MyString",
      :contact_id => 1,
      :completed => false
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_detail[name=?]", "task[detail]"

      assert_select "input#task_author[name=?]", "task[author]"

      assert_select "input#task_contact_id[name=?]", "task[contact_id]"

      assert_select "input#task_completed[name=?]", "task[completed]"
    end
  end
end
