class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :title, presence: true, length: { maximum: 150 }
  validates :content, presence: true

  mount_uploader :photo, PhotoUploader
end
