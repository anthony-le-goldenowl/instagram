# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  bio                    :text
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  followers_count        :integer          default(0), not null
#  followings_count       :integer          default(0), not null
#  gender                 :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  name                   :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  username               :string
#  website                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include Followable
  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  has_many :post_reactions
  has_many :posts, through: :post_reactions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def avatar_presence
    errors.add(:avatar, "can't be blank") unless avatar.attached?
  end

  def like_post(post_id)
    post_reactions.create(post_id: post_id)
  end

  def unlike_post(post_id)
    post_reactions.find_by(post_id: post_id).destroy
  end

  def liked?(post_id)
    PostReaction.exists?(post_id: post_id, user_id: id)
  end
end
