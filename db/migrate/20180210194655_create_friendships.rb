class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend, :null => false, foreign_key: false
      t.string :status
      t.timestamps
    end
  end
end
  