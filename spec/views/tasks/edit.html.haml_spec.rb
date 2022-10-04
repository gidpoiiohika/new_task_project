require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      title: "MyString",
      description: "MyString",
      user_id: "",
      list_id: "",
      priority: 1,
      soft_deleted: false
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input[name=?]", "task[title]"

      assert_select "input[name=?]", "task[description]"

      assert_select "input[name=?]", "task[user_id]"

      assert_select "input[name=?]", "task[list_id]"

      assert_select "input[name=?]", "task[priority]"

      assert_select "input[name=?]", "task[soft_deleted]"
    end
  end
end
