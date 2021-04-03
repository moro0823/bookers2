class Book < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, length: {minimum: 1, maximum: 200 }
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  
end
class Book < ApplicationRecord
  
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :body, length: {minimum: 1, maximum: 200 }
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  
end
