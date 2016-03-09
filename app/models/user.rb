class CheckForInvite < ActiveModel::Validator
  def validate(record)
    @inviter = User.find_by_token(record.invite_code)
    if @inviter.nil?
      record.errors[:invite_code] << "- Must provide a valid invite code!"
      return false
    end
  end
end

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :listings, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_listings, through: :favourites, source: :favourited, source_type: 'Listing'
  has_many :favourite_users, through: :favourites, source: :favourited, source_type: 'User'
  has_many :conversations, dependent: :destroy
  has_many :messages, through: :conversations, dependent: :destroy
  has_many :user_comments, as: :commentable, class_name:"Comment", dependent: :destroy
  has_many :listing_comments, through: :listings, source:"comments", dependent: :destroy
  acts_as_ordered_taggable
  has_secure_token
  mount_uploader :avatar, ImageUploader

  validates :password, length: { minimum: 6}, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, uniqueness: true
  validates_with CheckForInvite

  def has_secure_token(attribute = :token)
    require 'active_support/core_ext/securerandom'
    define_method("regenerate_#{attribute}") { update! attribute => self.class.generate_unique_secure_token }
    before_create { self.send("#{attribute}=", self.class.generate_unique_secure_token) unless self.send("#{attribute}?")}
  end

end
