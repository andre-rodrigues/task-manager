require 'rails_helper'

RSpec.describe "Tasks API" do
  before do
    TaskParser.parse("Estudar novas tecnologias 1 hora").save
  end

  let(:last_task) { Task.last }

  subject { JSON.parse(response.body) }

  it "lists all tasks" do
    get "/api/v1/tasks", format: :json
    expect(subject).to be_an Array
    expect(subject.count).to eq Task.count
  end

  it "shows a task" do
    get "/api/v1/tasks/#{ last_task.id }", format: :json
    expect(subject).to be_a Hash
    expect(subject).to eq JSON.parse(last_task.to_json)
  end

  it "creates a new task form a string input" do
    post "/api/v1/tasks", format: :json, string_input: "Tomar banho"
    expect(subject["id"]).to eq last_task.id
  end

  it "destroys a task" do
    delete "/api/v1/tasks/#{ last_task.id }", format: :json
    expect{ last_task.reload }.to raise_error(ActiveRecord::RecordNotFound)
  end

end