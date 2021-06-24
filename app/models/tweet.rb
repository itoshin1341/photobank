class Tweet < ApplicationRecord

  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions 
  belongs_to :prefecture

  has_one_attached :photo
  belongs_to :user

end