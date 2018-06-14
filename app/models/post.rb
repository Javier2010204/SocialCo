# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user

  scope :nuevos, ->{order("created_at desc")}

  def self.all_for_user(user)
  	Post.where(user_id: user.id)
  		.or(Post.where(user_id: user.friend_ids))
  		.or(Post.where(user_id: user.user_ids))
  end
end
