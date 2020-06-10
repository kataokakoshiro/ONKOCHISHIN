class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, presence: true
         
   has_many :tweets
   has_many :favorites
   has_many :favorite_tweets, through: :favorites, source: :tweet

   has_many :goods
   has_many :good_tweets, through: :goods, source: :tweet
   has_many :bads
   has_many :bad_tweets, through: :bads, source: :tweet
   


end
