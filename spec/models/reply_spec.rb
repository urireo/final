require 'rails_helper'

RSpec.describe Reply, type: :model do
  subject { Reply.new(comment_id: 1,  content: "This is a  reply to a coment on art is very amazing", user_id: 1)}

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a comment_id" do
    subject.comment_id=nil
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
