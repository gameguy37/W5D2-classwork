class ChangePostsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :sub_id, :integer
    add_column :posts, :postsub_id, :integer
  end
end
