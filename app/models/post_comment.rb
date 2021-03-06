class PostComment < ApplicationRecord
  belongs_to :member
  belongs_to :post
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 140 }

end
