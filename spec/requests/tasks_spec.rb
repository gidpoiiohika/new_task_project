require 'rails_helper'

RSpec.describe "/tasks", type: :request do

  let(:list) { create(:list)}
  let(:user) { create(:user)}
  let(:valid_attributes) { 
    { 
      title: 'updated_first_name', description: 'updated_last_name',
      user_id: user.id, list_id: list.id,
      soft_deleted: false, priority: 'high', 
    } 
  }
  let(:invalid_attributes) { 
    { 
      title: 'updated_first_name', description: '',
      user_id: user.id, list_id: list.id,
      soft_deleted: false, priority: 'high', 
    }  
  }


  describe "GET /new" do
    let(:user) { create(:user)}

    before(:each) do
      sign_in user
    end

    it "renders a successful response" do
      get new_task_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:user) { create(:user)}

    before(:each) do
      sign_in user
    end

    it "renders a successful response" do
      task = Task.create! valid_attributes
      get edit_task_url(task)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:user) { create(:user)}

    before(:each) do
      sign_in user
    end

    context "with valid parameters" do
      it "creates a new Task" do
        expect {
          post tasks_url, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post tasks_url, params: { task: valid_attributes }
        expect(response).to redirect_to(root_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Task" do
        expect {
          post tasks_url, params: { task: invalid_attributes }
        }.to change(Task, :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    let(:user) { create(:user)}

    before(:each) do
      sign_in user
    end

    context "with valid parameters" do
      let(:new_attributes) {
        { 
          title: 'updated_title', description: 'updated_description',
          user_id: user.id, list_id: list.id,
          soft_deleted: false, priority: 'medium', 
        } 
      }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        patch task_url(task), params: { task: new_attributes }
        task.reload
      end

      it "redirects to the task" do
        task = Task.create! valid_attributes
        patch task_url(task), params: { task: new_attributes }
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
