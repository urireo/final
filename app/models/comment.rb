class Comment < ApplicationRecord
  belongs_to :post, optional: true
  has_many :replies, dependent: :destroy
  belongs_to :user, optional: true

  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true



end
