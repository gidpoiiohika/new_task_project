require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        title: "Title",
        description: "Description",
        user_id: "",
        list_id: "",
        priority: 2,
        soft_deleted: false
      ),
      Task.create!(
        title: "Title",
        description: "Description",
        user_id: "",
        list_id: "",
        priority: 2,
        soft_deleted: false
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
