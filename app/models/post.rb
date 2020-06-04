class Post < ApplicationRecord
  belongs_to :user, optional: true

  # destroy associated comments on article deletion
  has_many :comments, dependent: :destroy
  has_one_attached :image


  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true


end
