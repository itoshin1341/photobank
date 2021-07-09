class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: { message: "必須入力の項目です。"} do
    validates :nickname
    validates :city
    validates :gender_id
    validates :birthday
    validates :introduction
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角（ひらがな、カタカナ、漢字）での入力をお願いします。" } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナでの入力をお願いします。" } do
    validates :last_name_kana
    validates :first_name_kana
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :gender

  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "パスワードは、半角英数字混合かつ6文字以上にて入力してください。" 

  mount_uploader :image, ImageUploader
  has_many :tweets
  has_many :comments

end
