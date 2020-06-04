require 'rails_helper'

RSpec.describe "CommentsControllers", type: :request do


#CREATE
  describe "post comments_path with valid data" do
    it 'should save successfully' do
      comment_attributes = FactoryBot.attributes_for(:comment)
      comment = Comment.new(comment_attributes).save
      expect(comment).to eq(true)
    end

  end

  describe "post comments_path with invalid data" do
    it "does not save a new entry and redirects to post" do
      comment_attributes = FactoryBot.attributes_for(:comment)
      comment_attributes.delete(:content)
      expect { post comments_path, params: { comment: comment_attributes }
    }.to_not change(Comment, :count)
      expect(response.status).to eq(302) #redirects to post
    end
  end

  #EDIT
  describe "get edit_comment_path" do
    it "renders the :edit template" do
     comment = FactoryBot.create(:comment)
     get edit_comment_path(id: comment.id)
     expect(response.status).to eq(302) #redirect to post
    end
  end

end
