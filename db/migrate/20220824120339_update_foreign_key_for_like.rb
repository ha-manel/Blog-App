class UpdateForeignKeyForLike < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :likes, :users, column: "author_id"
    add_foreign_key :likes, :users, on_delete: :cascade, column: "author_id"

    remove_foreign_key :likes, :posts
    add_foreign_key :likes, :posts, on_delete: :cascade
  end
end
