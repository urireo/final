class Reply < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :comment, optional: true

  validates :content, presence: true
  validates :comment_id, presence: true
  validates :user_id, presence: true
end
