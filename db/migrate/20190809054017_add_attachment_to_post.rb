class AddAttachmentToPost < ActiveRecord::Migration[5.1]
  def change
      add_attachment :posts, :image_post
  end
end
