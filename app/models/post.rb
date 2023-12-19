class Post < ApplicationRecord
  validates :title, :content, presence: true
  validates :content, length: { minimum: 20 }
  validates :title, length: { maximum: 60 }, uniqueness: { scope: :content }

  has_one_attached :photo
end
