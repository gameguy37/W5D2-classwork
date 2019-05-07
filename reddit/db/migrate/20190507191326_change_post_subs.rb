class ChangePostSubs < ActiveRecord::Migration[5.2]
  def change
    rename_table :postsubs, :post_subs
  end
end
