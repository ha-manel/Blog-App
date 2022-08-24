class UpdateForeignKeyForPost < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :posts, :users, column: "author_id"
    add_foreign_key :posts, :users, on_delete: :cascade, column: "author_id"
  end
end
