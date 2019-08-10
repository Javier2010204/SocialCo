# == Schema Information
#
# Table name: posts
#
#  id                      :integer          not null, primary key
#  body                    :text
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  image_post_file_name    :string
#  image_post_content_type :string
#  image_post_file_size    :integer
#  image_post_updated_at   :datetime
#

class Post < ApplicationRecord
  belongs_to :user

  after_create :send_to_action_cable

  scope :nuevos, ->{order("created_at desc")}

  has_attached_file :image_post, styles: {thumb: "100x100", medium: "500x500"}, default_url:"/missing.png"

  validates_attachment_content_type :image_post, content_type: /\Aimage\/.*\Z/

  def self.all_for_user(user)
  	Post.where(user_id: user.id)
  		.or(Post.where(user_id: user.friend_ids))
  		.or(Post.where(user_id: user.user_ids))
  end

  private
  	def send_to_action_cable

  		data = {message: to_html, action: "new_post"}

  		self.user.friend_ids.each do |friend_id|
  			ActionCable.server.broadcast "demo", data
  		end

  		self.user.user_ids.each do |friend_id|

  		end
  	end

  	def to_html
  		ApplicationController.renderer.render(partial: "posts/post", locals: {post: self})
  	end


end
