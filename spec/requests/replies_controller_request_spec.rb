require 'rails_helper'

RSpec.describe "RepliesControllers", type: :request do
  #CREATE
  describe "post replies_path with valid data" do
    it 'should save successfully' do
      reply_attributes = FactoryBot.attributes_for(:reply)
      reply = Reply.new(reply_attributes).save
      expect(reply).to eq(true)
    end

  end

  describe "post replies_path with invalid data" do
    it "does not save a new entry and redirects to post" do
      reply_attributes = FactoryBot.attributes_for(:reply)
      reply_attributes.delete(:content)
      expect { post replies_path, params: { reply: reply_attributes }
    }.to_not change(Reply, :count)
      expect(response.status).to eq(302) #redirects to post
    end
  end

  #EDIT
  describe "get edit_reply_path" do
    it "renders the :edit template" do
     reply = FactoryBot.create(:reply)
     get edit_reply_path(id: reply.id)
     expect(response.status).to eq(302) #redirect to post
    end
  end
end
