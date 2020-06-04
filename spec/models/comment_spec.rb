require 'rails_helper'

RSpec.describe Comment, type: :model do

  subject { Comment.new(post_id: 1,  content: "This is a  comment to art is very amazing", user_id: 1)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a post_id" do
    subject.post_id=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a content" do
    subject.content=nil
   expect(subject).to_not be_valid
  end

    it "is not valid without a user_id" do
      subject.user_id=nil
      expect(subject).to_not be_valid
    end
end
