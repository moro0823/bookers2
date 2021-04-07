class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :profile_image

  has_many :follower, class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy
  # ユーザーとフォローする人と結びつける
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # ユーザーとフォローされる人を結びつける
  has_many :following_user, through: :follower, source: :followed
  # 自分がフォローしている人を取得
  has_many :follower_user, through: :followed, source: :follower
  # 自分がフォローされた人を取得

  def follow(user_id)
    follower.create(followed_id: user_id)
  end


  def unfollow(user_id)
   follower.find_by(followed_id: user_id).destroy
  end

  def following?(user)
   following_user.include?(user)
  end

  def self.looks(searches, words)
    if searches == "perfect_match"
      @user =User.where("name LIKE ?", "#{words}")
    elsif searches == "partial_match"
      @user = User.where("name LIKE ?", "%#{words}%")
    elsif searches == "forward_match"
      @user = User.where("name LIKE ?", "#{words}%")
    elsif searches == "backward_match"
      @user = User.where("name LIKE ?", "%#{words}")
    else
      @user = User.all
    end
  end
  
  def favorited_by?(book_id)
    favorites.where(book_id: book_id).exists?
  end
  
  include JpPrefecture
   jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end


  validates :name,uniqueness: {message: "その名前は使用できません"}, length: {minimum: 2, maximum: 20 }
  validates :introduction,length: {maximum: 50 }
  
end
