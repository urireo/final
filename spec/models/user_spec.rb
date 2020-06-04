require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(name: "Jack",  email: "jsmith@sample.com", password:"Password123" )}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an e-mail" do
    subject.email=nil
    expect(subject).to_not be_valid
  end

    it "is not valid without a password" do
      subject.password=nil
      expect(subject).to_not be_valid
    end

    it "is not valid if the name is less than 3  chars" do
      subject.name="AJ"
      expect(subject).to_not be_valid
    end
    it "is not valid if the name is less more than 20  chars" do
      subject.name="Monica Marie Brownsmith"
      expect(subject).to_not be_valid
    end
    it "is not valid if the password is less than 6  chars" do
      subject.password="ab123"
      expect(subject).to_not be_valid
    end
    it "is not valid if the password is less more than 20  chars" do
      subject.password="Thisismypreciouspassword"
      expect(subject).to_not be_valid
    end


end
