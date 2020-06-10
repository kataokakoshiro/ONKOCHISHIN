class Tweet < ApplicationRecord
    belongs_to :user
    has_many :favorites
    has_many :goods
    has_many :bads
    mount_uploader :image, ImageUploader
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
    def gooded_by?(user)
        goods.where(user_id: user.id).exists?
    end
    def baded_by?(user)
        bads.where(user_id: user.id).exists?
    end        
    has_many :tweet_tags, dependent: :destroy
    has_many :tags, through: :tweet_tags

    default_scope -> { order(created_at: :desc) }
end
