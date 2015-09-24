require 'rails_helper'

RSpec.describe Task, type: :model do

  it "has a time to start" do
    expect(subject).to respond_to :start_at
  end

  it "has a time to finish" do
    expect(subject).to respond_to :end_at
  end

  it "has a description" do
    expect(subject).to respond_to :description
  end
end
