require 'rails_helper'

RSpec.describe "PostsControllers", type: :request do

  describe "get posts_path" do
    it "renders the index view" do
      FactoryBot.create_list(:post, 10)
      get posts_path
      expect(response.status).to eq(200)
    end
  end
#READ
  describe "get post_path" do
    it "renders the :show template" do
      post = FactoryBot.create(:post)
      get post_path(id: post.id)
      expect(response.status).to eq(200)
    end
    it "redirects to the index path if the user id is invalid" do
      get post_path(id: 5000) #an ID that doesn't exist
      expect(response).to redirect_to posts_path
    end
  end

  describe "get new_post_path" do  #tests the new action for users controller
   it "renders the :new template" do #loadign a form and showing us that form, no need to access Database
     get new_post_path  #testing new user path, no need if costumer IF
     expect(response.status).to eq(200)
   end
  end

#CREATE
  describe "post posts_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
     post_attributes = FactoryBot.attributes_for(:post)
      expect { post posts_path, params: { post: post_attributes }
    }.to change(Post, :count)
      expect(response).to redirect_to post_path(id: Post.last.id)
    end
  end

  describe "post posts_path with invalid data" do
    it "does not save a new entry or redirect" do
      post_attributes = FactoryBot.attributes_for(:post)
      post_attributes.delete(:title)
      expect { post posts_path, params: { post: post_attributes }
    }.to_not change(Post, :count)
      expect(response.status).to eq(200)
    end
  end

  #EDIT
  describe "get edit_post_path" do
    it "renders the :edit template" do
     post = FactoryBot.create(:post)
     get edit_post_path(id: post.id)
     expect(response.status).to eq(200)
    end
  end

#DELETE
  describe "delete a post record" do
    it "deletes a post record" do
      post = FactoryBot.create(:post)
      expect { delete post_path(post.id) }.to change {Post.count}.by(-1)
      expect(response.status).to eq(302)
    end
  end



end
