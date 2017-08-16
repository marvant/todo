require 'rails_helper'

RSpec.describe Task, type: :model do
	before(:all) do
    	User.destroy_all
    	Task.destroy_all

    	@user1 = User.create(email: "test@mail.com", password: "111111")
      @user2 = User.create(email: "test2@mail.com", password: "111111")
    	@task1 = Task.create(user_id: @user1.id, title: "Task 1", deadline: "1/1/2018")
      @task2 = Task.create(user_id: @user1.id, title: "Task 2", deadline: "2/1/2018")
  end

  context "can create, update, and delete task" do
  	it "creates new task" do 
  		@new_task = Task.create(user_id: @user1.id, title: "New Task", deadline: "2/2/2018")
  		expect(@new_task).to eq(Task.last)
  	end

    it "updates task" do
      @task1.deadline = "1/1/2019"
      expect(@task1.deadline.to_s).to eq("2019-01-01")
    end

    it "deletes a task" do
      expect { @task2.destroy}.to change(Task, :count).by(-1)
    end
  end

  context "assocation" do 
    it "checkes task-user association" do 
      expect(@task1.user_id).to eq(@user1.id)
    end
  end
end
