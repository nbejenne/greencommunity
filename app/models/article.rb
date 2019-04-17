class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :title, presence: true
  validates :content, presence: true
  validates :source, presence: true

  mount_uploader :photo, PhotoUploader
end
