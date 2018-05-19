require 'rails_helper'


RSpec.describe Note, :type => :model do
  subject {
    described_class.new(id: '21', title: "Anything",
                        content: "Some text", status: "draft", created_at: DateTime.now,
                        updated_at: DateTime.now, user_id: '1' )
  }

  it "is not valid without id" do
    subject.id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without status" do
    subject.status = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a created_date" do
    subject.created_at = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a updated_date" do
    subject.updated_at = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a user id" do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

end