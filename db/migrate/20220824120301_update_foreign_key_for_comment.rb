class UpdateForeignKeyForComment < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :comments, :users, column: "author_id"
    add_foreign_key :comments, :users, on_delete: :cascade, column: "author_id"

    remove_foreign_key :comments, :posts
    add_foreign_key :comments, :posts, on_delete: :cascade
  end
end
