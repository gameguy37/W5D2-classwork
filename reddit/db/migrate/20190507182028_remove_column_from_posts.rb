class RemoveColumnFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :postsub_id, :integer
  end
end
