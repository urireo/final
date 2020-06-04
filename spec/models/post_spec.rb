require 'rails_helper'

RSpec.describe Post, type: :model do
    @user = User.last
    subject { Post.new(title: "Art",  content: "art is very amazing", user_id: 1)}

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "is not valid without a title" do
      subject.title=nil
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
